import { http, jumpExport } from '@/utils/http/axios';

// 获取游戏路由列表
export function List(params) {
  return http.request({
    url: '/gameRoute/list',
    method: 'get',
    params,
  });
}

// 删除/批量删除游戏路由
export function Delete(params) {
  return http.request({
    url: '/gameRoute/delete',
    method: 'POST',
    params,
  });
}


// 添加/编辑游戏路由
export function Edit(params) {
  return http.request({
    url: '/gameRoute/edit',
    method: 'POST',
    params,
  });
}




// 获取游戏路由指定详情
export function View(params) {
  return http.request({
    url: '/gameRoute/view',
    method: 'GET',
    params,
  });
}



// 导出游戏路由
export function Export(params) {
  jumpExport('/gameRoute/export', params);
}