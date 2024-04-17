// Package gamedifflevelconfig
// @Link  https://github.com/bufanyun/hotgo
// @Copyright  Copyright (c) 2024 HotGo CLI
// @Author  Ms <133814250@qq.com>
// @License  https://github.com/bufanyun/hotgo/blob/master/LICENSE
// @AutoGenerate Version 2.9.8
package gamedifflevelconfig

import (
	"hotgo/internal/model/input/form"
	"hotgo/internal/model/input/sysin"

	"github.com/gogf/gf/v2/frame/g"
)

// ListReq 查询找茬关卡配置表列表
type ListReq struct {
	g.Meta `path:"/gameDiffLevelConfig/list" method:"get" tags:"找茬关卡配置表" summary:"获取找茬关卡配置表列表"`
	sysin.GameDiffLevelConfigListInp
}

type ListRes struct {
	form.PageRes
	List []*sysin.GameDiffLevelConfigListModel `json:"list"   dc:"数据列表"`
}

// ExportReq 导出找茬关卡配置表列表
type ExportReq struct {
	g.Meta `path:"/gameDiffLevelConfig/export" method:"get" tags:"找茬关卡配置表" summary:"导出找茬关卡配置表列表"`
	sysin.GameDiffLevelConfigListInp
}

type ExportRes struct{}

// ViewReq 获取找茬关卡配置表指定信息
type ViewReq struct {
	g.Meta `path:"/gameDiffLevelConfig/view" method:"get" tags:"找茬关卡配置表" summary:"获取找茬关卡配置表指定信息"`
	sysin.GameDiffLevelConfigViewInp
}

type ViewRes struct {
	*sysin.GameDiffLevelConfigViewModel
}

// EditReq 修改/新增找茬关卡配置表
type EditReq struct {
	g.Meta `path:"/gameDiffLevelConfig/edit" method:"post" tags:"找茬关卡配置表" summary:"修改/新增找茬关卡配置表"`
	sysin.GameDiffLevelConfigEditInp
}

type EditRes struct{}

// DeleteReq 删除找茬关卡配置表
type DeleteReq struct {
	g.Meta `path:"/gameDiffLevelConfig/delete" method:"post" tags:"找茬关卡配置表" summary:"删除找茬关卡配置表"`
	sysin.GameDiffLevelConfigDeleteInp
}

type DeleteRes struct{}
