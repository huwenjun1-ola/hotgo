// Package sys
// @Link  https://github.com/bufanyun/hotgo
// @Copyright  Copyright (c) 2023 HotGo CLI
// @Author  Ms <133814250@qq.com>
// @License  https://github.com/bufanyun/hotgo/blob/master/LICENSE
// @AutoGenerate Version 2.9.8
package sys

import (
	"context"

	"hotgo/api/admin/gameroute"
	"hotgo/internal/service"
)

var (
	GameRoute = cGameRoute{}
)

type cGameRoute struct{}

// List 查看游戏路由列表
func (c *cGameRoute) List(ctx context.Context, req *gameroute.ListReq) (res *gameroute.ListRes, err error) {
	list, totalCount, err := service.SysGameRoute().List(ctx, &req.GameRouteListInp)
	if err != nil {
		return
	}

	res = new(gameroute.ListRes)
	res.List = list
	res.PageRes.Pack(req, totalCount)
	return
}

// Export 导出游戏路由列表
func (c *cGameRoute) Export(ctx context.Context, req *gameroute.ExportReq) (res *gameroute.ExportRes, err error) {
	err = service.SysGameRoute().Export(ctx, &req.GameRouteListInp)
	return
}

// Edit 更新游戏路由
func (c *cGameRoute) Edit(ctx context.Context, req *gameroute.EditReq) (res *gameroute.EditRes, err error) {
	err = service.SysGameRoute().Edit(ctx, &req.GameRouteEditInp)
	proxyPool.Remove(req.GameRouteEditInp.FactoryType)
	return
}

// View 获取指定游戏路由信息
func (c *cGameRoute) View(ctx context.Context, req *gameroute.ViewReq) (res *gameroute.ViewRes, err error) {
	data, err := service.SysGameRoute().View(ctx, &req.GameRouteViewInp)
	if err != nil {
		return
	}

	res = new(gameroute.ViewRes)
	res.GameRouteViewModel = data
	return
}

// Delete 删除游戏路由
func (c *cGameRoute) Delete(ctx context.Context, req *gameroute.DeleteReq) (res *gameroute.DeleteRes, err error) {
	err = service.SysGameRoute().Delete(ctx, &req.GameRouteDeleteInp)
	proxyPool.Remove(req.FactoryType)

	return
}
