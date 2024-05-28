#!/bin/bash

cd "$(dirname "$0")" || exit
cd ..

# 本地变量
source ./deploy/env.sh || exit 1

game=$1
if [[ $game == "" ]]; then
  echo "Usage: ./deploy_one_v2_aopa.sh game config"
  exit 1
fi
config=$2
if [[ $config == "" ]]; then
  echo "Usage: ./deploy_one_v2_aopa.sh game config"
  exit 1
fi
stateful=$3

ADAPTOR="banban" # $config == "local"
for ad in "${AdaptorList[@]}"; do
  if [[ "$config" =~ ^"${ad}".* ]]; then
    ADAPTOR="${ad}"
    break
  fi
done

echo "adaptor ${ADAPTOR}"

targetPath="/home/ecs-user/webroot/game-${game}.${ADAPTOR}"
logPath="/home/ecs-user/log/game"

if [ ! -d "$targetPath/config" ]; then
  mkdir -p "$targetPath/config"
fi

if [ ! -d "$logPath" ]; then
  mkdir -p "$logPath"
fi

copyfile() {
#  ./deploy/consul/consul.sh $config $game
  #复制目录过去
  dirs=("bin" "manifest" )
  if [[ ${config} == "local" || ${config} == "psdev" ]]; then
    dirs+=("swagger")
  fi
  for dir in "${dirs[@]}"; do
    if ! cp -rf "${dir}" "${targetPath}"; then
      echo "error to copy agent to target"
      exit 1
    fi
  done
  cp -rf "${targetPath}/config/config_${config}.toml" "${targetPath}/config/config.toml"
  if [[ $stateful == "stateful" ]];then
      cp -rf "${targetPath}/config/${ADAPTOR}/${game}.toml" "${targetPath}/config/${game}.toml"
  fi
  cp -f "${nSuperFile}" "${oSuperFile}"
}

update_stateful() {
  # 已经有这个游戏
   #检查文件是否发生变化了
   oGameFile="${targetPath}/config/${game}.toml"
   nGameFile="config/${ADAPTOR}/${game}.toml"
   echo "${nGameFile}"
   echo "${oGameFile}"
   if diff "${nGameFile}" "${oGameFile}" >/dev/null; then
     # 文件无差异，不需要更新
     echo "${game} file are same"
     exit 0
   else
     echo "${game} file are different!!!"
     copyfile

     # TODO: temp restart for veeka
     # supervisorctl restart game.${game}

     v=$(supervisorctl status "game.${game}.${ADAPTOR}"| awk '{print $2}')
     case $v in
       "RUNNING")
         if ! supervisorctl signal SIGHUP "game.${game}.${ADAPTOR}"; then
           echo "error with supervisorctl ${game}.${ADAPTOR}"
           exit 1
         fi
         sleep 5
         ;;
       *)
         echo "Something Error, Update Manual Please!!!!!!!"
         exit 1
         ;;
     esac
   fi
}

update_stateless() {
    # 已经有这个游戏
    #检查文件是否发生变化了
    if diff "${nSuperFile}" "${oSuperFile}" >/dev/null; then
      # 文件无差异，不需要更新
      echo "${game} file are same"
      exit 0
    else
      echo "${game} file are different!!!"
      copyfile
      if ! supervisorctl update "game.${game}.${ADAPTOR}"; then
        echo "error with supervisorctl ${game}"
        exit 1
      fi
      sleep 5
    fi
}

oSuperFile="/home/ecs-user/.local/etc/supervisor/conf.d/game.${game}.${ADAPTOR}.conf"
nSuperFile="deploy/supervisor/${ADAPTOR}/game.${game}.${ADAPTOR}.conf"
if [ ! -f "${oSuperFile}" ]; then
  # 不存在游戏的supervisor配置
  copyfile
  #更新 supervisor 配置
  #系统会自动启动进程
  if ! supervisorctl update "game.${game}.${ADAPTOR}"; then
    echo "error with supervisorctl ${game}.${ADAPTOR}"
    exit 1
  fi
  sleep 5
else
   if [[ $stateful == "stateless" ]];then
     update_stateless || exit $?
   else
     update_stateful || exit $?
   fi
fi

# pgrep -af "game-${game}"
# pgrep -f "game-${game}" | xargs kill -9
# pgrep -af "game-${game}"


# 判断进程状态
for k in {1..5}; do
  sleep 1
  v=$(supervisorctl status "game.${game}.${ADAPTOR}"| awk '{print $2}')
  case $v in
    "RUNNING")
      echo "check status ${k} ok"
      ;;
    "STARTING")
      echo "check status ${k} starting"
      ;;
    *)
      echo "error status with ${game}.${ADAPTOR}"
      supervisorctl status "game.${game}.${ADAPTOR}"
      exit 1
      ;;
  esac

done

ps aux | grep "game-${game}.${ADAPTOR}"

supervisorctl status

echo "ok"
exit 0
