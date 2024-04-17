// Package sys
// @Link  https://github.com/bufanyun/hotgo
// @Copyright  Copyright (c) 2024 HotGo CLI
// @Author  Ms <133814250@qq.com>
// @License  https://github.com/bufanyun/hotgo/blob/master/LICENSE
// @AutoGenerate Version 2.9.8
package sys

import (
	"context"
	"hotgo/api/admin/gamedifflevelconfig"
	"hotgo/internal/service"
)

var (
	GameDiffLevelConfig = cGameDiffLevelConfig{}
)

type cGameDiffLevelConfig struct{}

// List 查看找茬关卡配置表列表
func (c *cGameDiffLevelConfig) List(ctx context.Context, req *gamedifflevelconfig.ListReq) (res *gamedifflevelconfig.ListRes, err error) {
	list, totalCount, err := service.SysGameDiffLevelConfig().List(ctx, &req.GameDiffLevelConfigListInp)
	if err != nil {
		return
	}

	res = new(gamedifflevelconfig.ListRes)
	res.List = list
	res.PageRes.Pack(req, totalCount)
	return
}

// Export 导出找茬关卡配置表列表
func (c *cGameDiffLevelConfig) Export(ctx context.Context, req *gamedifflevelconfig.ExportReq) (res *gamedifflevelconfig.ExportRes, err error) {
	err = service.SysGameDiffLevelConfig().Export(ctx, &req.GameDiffLevelConfigListInp)
	return
}

// Edit 更新找茬关卡配置表
func (c *cGameDiffLevelConfig) Edit(ctx context.Context, req *gamedifflevelconfig.EditReq) (res *gamedifflevelconfig.EditRes, err error) {
	err = service.SysGameDiffLevelConfig().Edit(ctx, &req.GameDiffLevelConfigEditInp)
	return
}

// View 获取指定找茬关卡配置表信息
func (c *cGameDiffLevelConfig) View(ctx context.Context, req *gamedifflevelconfig.ViewReq) (res *gamedifflevelconfig.ViewRes, err error) {
	data, err := service.SysGameDiffLevelConfig().View(ctx, &req.GameDiffLevelConfigViewInp)
	if err != nil {
		return
	}

	res = new(gamedifflevelconfig.ViewRes)
	res.GameDiffLevelConfigViewModel = data
	return
}

// Delete 删除找茬关卡配置表
func (c *cGameDiffLevelConfig) Delete(ctx context.Context, req *gamedifflevelconfig.DeleteReq) (res *gamedifflevelconfig.DeleteRes, err error) {
	err = service.SysGameDiffLevelConfig().Delete(ctx, &req.GameDiffLevelConfigDeleteInp)
	return
}
