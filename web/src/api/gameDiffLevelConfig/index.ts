import { http, jumpExport } from '@/utils/http/axios';

// 获取找茬关卡配置表列表
export function List(params) {
  return http.request({
    url: '/gameDiffLevelConfig/list',
    method: 'get',
    params,
  });
}

// 删除/批量删除找茬关卡配置表
export function Delete(params) {
  return http.request({
    url: '/gameDiffLevelConfig/delete',
    method: 'POST',
    params,
  });
}


// 添加/编辑找茬关卡配置表
export function Edit(params) {
  return http.request({
    url: '/gameDiffLevelConfig/edit',
    method: 'POST',
    params,
  });
}




// 获取找茬关卡配置表指定详情
export function View(params) {
  return http.request({
    url: '/gameDiffLevelConfig/view',
    method: 'GET',
    params,
  });
}



// 导出找茬关卡配置表
export function Export(params) {
  jumpExport('/gameDiffLevelConfig/export', params);
}