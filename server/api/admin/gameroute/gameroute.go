// Package gameroute
// @Link  https://github.com/bufanyun/hotgo
// @Copyright  Copyright (c) 2023 HotGo CLI
// @Author  Ms <133814250@qq.com>
// @License  https://github.com/bufanyun/hotgo/blob/master/LICENSE
// @AutoGenerate Version 2.9.8
package gameroute

import (
	"hotgo/internal/model/input/form"
	"hotgo/internal/model/input/sysin"

	"github.com/gogf/gf/v2/frame/g"
)

// ListReq 查询游戏路由列表
type ListReq struct {
	g.Meta `path:"/gameRoute/list" method:"get" tags:"游戏路由" summary:"获取游戏路由列表"`
	sysin.GameRouteListInp
}

type ListRes struct {
	form.PageRes
	List []*sysin.GameRouteListModel `json:"list"   dc:"数据列表"`
}

// ExportReq 导出游戏路由列表
type ExportReq struct {
	g.Meta `path:"/gameRoute/export" method:"get" tags:"游戏路由" summary:"导出游戏路由列表"`
	sysin.GameRouteListInp
}

type ExportRes struct{}

// ViewReq 获取游戏路由指定信息
type ViewReq struct {
	g.Meta `path:"/gameRoute/view" method:"get" tags:"游戏路由" summary:"获取游戏路由指定信息"`
	sysin.GameRouteViewInp
}

type ViewRes struct {
	*sysin.GameRouteViewModel
}

// EditReq 修改/新增游戏路由
type EditReq struct {
	g.Meta `path:"/gameRoute/edit" method:"post" tags:"游戏路由" summary:"修改/新增游戏路由"`
	sysin.GameRouteEditInp
}

type EditRes struct{}

// DeleteReq 删除游戏路由
type DeleteReq struct {
	g.Meta `path:"/gameRoute/delete" method:"post" tags:"游戏路由" summary:"删除游戏路由"`
	sysin.GameRouteDeleteInp
}

type DeleteRes struct{}
