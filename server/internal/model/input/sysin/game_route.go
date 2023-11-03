// Package sysin
// @Link  https://github.com/bufanyun/hotgo
// @Copyright  Copyright (c) 2023 HotGo CLI
// @Author  Ms <133814250@qq.com>
// @License  https://github.com/bufanyun/hotgo/blob/master/LICENSE
// @AutoGenerate Version 2.9.8
package sysin

import (
	"context"

	"hotgo/internal/model/entity"
	"hotgo/internal/model/input/form"

	"github.com/gogf/gf/v2/frame/g"
)

// GameRouteUpdateFields 修改游戏路由字段过滤
type GameRouteUpdateFields struct {
	FactoryType string `json:"factoryType" dc:"房型"`
	Url         string `json:"url"         dc:"游戏地址"`
	Desc        string `json:"desc"        dc:"描述"`
}

// GameRouteInsertFields 新增游戏路由字段过滤
type GameRouteInsertFields struct {
	FactoryType string `json:"factoryType" dc:"房型"`
	Url         string `json:"url"         dc:"游戏地址"`
	Desc        string `json:"desc"        dc:"描述"`
}

// GameRouteEditInp 修改/新增游戏路由
type GameRouteEditInp struct {
	entity.GameRoute
}

func (in *GameRouteEditInp) Filter(ctx context.Context) (err error) {
	// 验证房型
	if err := g.Validator().Rules("required").Data(in.FactoryType).Messages("房型不能为空").Run(ctx); err != nil {
		return err.Current()
	}

	// 验证游戏地址
	if err := g.Validator().Rules("required").Data(in.Url).Messages("游戏地址不能为空").Run(ctx); err != nil {
		return err.Current()
	}

	return
}

type GameRouteEditModel struct{}

// GameRouteDeleteInp 删除游戏路由
type GameRouteDeleteInp struct {
	Id          interface{} `json:"id" v:"required#id不能为空" dc:"id"`
	FactoryType string      `json:"factoryType" description:"房型"`
}

func (in *GameRouteDeleteInp) Filter(ctx context.Context) (err error) {
	return
}

type GameRouteDeleteModel struct{}

// GameRouteViewInp 获取指定游戏路由信息
type GameRouteViewInp struct {
	Id int `json:"id" v:"required#id不能为空" dc:"id"`
}

func (in *GameRouteViewInp) Filter(ctx context.Context) (err error) {
	return
}

type GameRouteViewModel struct {
	entity.GameRoute
}

// GameRouteListInp 获取游戏路由列表
type GameRouteListInp struct {
	form.PageReq
	Id          int    `json:"id" dc:"id"`
	FactoryType string `json:"factoryType" dc:"房型"`
}

func (in *GameRouteListInp) Filter(ctx context.Context) (err error) {
	return
}

type GameRouteListModel struct {
	Id          int    `json:"id"          dc:"id"`
	FactoryType string `json:"factoryType" dc:"房型"`
	Url         string `json:"url"         description:"游戏地址"`
	Desc        string `json:"desc"        description:"描述"`
}

// GameRouteExportModel 导出游戏路由
type GameRouteExportModel struct {
	Id          int    `json:"id"          dc:"id"`
	FactoryType string `json:"factoryType" dc:"房型"`
	Url         string `json:"url"         description:"游戏地址"`
	Desc        string `json:"desc"        description:"描述"`
}
