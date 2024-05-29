#!/bin/bash


cd "$(dirname "$0")" || exit


# stateless games
sl_games=(admin )

for sl_game in "${sl_games[@]}"; do
  ./deploy_one_v2_aopa.sh "${sl_game}" slpdev stateless
done

