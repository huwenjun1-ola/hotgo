// Package sysin
// @Link  https://github.com/bufanyun/hotgo
// @Copyright  Copyright (c) 2024 HotGo CLI
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

// GameDiffLevelConfigUpdateFields 修改找茬关卡配置表字段过滤
type GameDiffLevelConfigUpdateFields struct {
	ImgA        string `json:"imgA"        dc:"图片A的地址"`
	ImgB        string `json:"imgB"        dc:"图片B的地址"`
	Type        string `json:"type"        dc:"图片主题类型"`
	AnswerRects string `json:"answerRects" dc:"answer_rects"`
	Layout      int    `json:"layout"         dc:"0 左右 1 上下"`
	Desc        string `json:"desc"         dc:"描述"`
}

// GameDiffLevelConfigInsertFields 新增找茬关卡配置表字段过滤
type GameDiffLevelConfigInsertFields struct {
	ImgA        string `json:"imgA"        dc:"图片A的地址"`
	ImgB        string `json:"imgB"        dc:"图片B的地址"`
	Type        string `json:"type"        dc:"图片主题类型"`
	AnswerRects string `json:"answerRects" dc:"answer_rects"`
	Layout      int    `json:"layout"         dc:"0 左右 1 上下"`
	Desc        string `json:"desc"         dc:"描述"`
}

// GameDiffLevelConfigEditInp 修改/新增找茬关卡配置表
type GameDiffLevelConfigEditInp struct {
	entity.GameDiffLevelConfig
}

func (in *GameDiffLevelConfigEditInp) Filter(ctx context.Context) (err error) {
	// 验证图片A的地址
	if err := g.Validator().Rules("required").Data(in.ImgA).Messages("图片A的地址不能为空").Run(ctx); err != nil {
		return err.Current()
	}

	// 验证图片B的地址
	if err := g.Validator().Rules("required").Data(in.ImgB).Messages("图片B的地址不能为空").Run(ctx); err != nil {
		return err.Current()
	}

	// 验证图片主题类型
	if err := g.Validator().Rules("required").Data(in.Type).Messages("图片主题类型不能为空").Run(ctx); err != nil {
		return err.Current()
	}

	// 验证answer_rects
	if err := g.Validator().Rules("required").Data(in.AnswerRects).Messages("answer_rects不能为空").Run(ctx); err != nil {
		return err.Current()
	}

	// 验证0 左右 1 上下
	if err := g.Validator().Rules("required").Data(in.Layout).Messages("0 左右 1 上下不能为空").Run(ctx); err != nil {
		return err.Current()
	}

	return
}

type GameDiffLevelConfigEditModel struct{}

// GameDiffLevelConfigDeleteInp 删除找茬关卡配置表
type GameDiffLevelConfigDeleteInp struct {
	LevelId interface{} `json:"levelId" v:"required#关卡id不能为空" dc:"关卡id"`
}

func (in *GameDiffLevelConfigDeleteInp) Filter(ctx context.Context) (err error) {
	return
}

type GameDiffLevelConfigDeleteModel struct{}

// GameDiffLevelConfigViewInp 获取指定找茬关卡配置表信息
type GameDiffLevelConfigViewInp struct {
	LevelId int `json:"levelId" v:"required#关卡id不能为空" dc:"关卡id"`
}

func (in *GameDiffLevelConfigViewInp) Filter(ctx context.Context) (err error) {
	return
}

type GameDiffLevelConfigViewModel struct {
	entity.GameDiffLevelConfig
}

// GameDiffLevelConfigListInp 获取找茬关卡配置表列表
type GameDiffLevelConfigListInp struct {
	form.PageReq
	LevelId int    `json:"levelId" dc:"关卡id"`
	Type    string `json:"type"        dc:"图片主题类型"`
}

func (in *GameDiffLevelConfigListInp) Filter(ctx context.Context) (err error) {
	return
}

type GameDiffLevelConfigListModel struct {
	LevelId     int    `json:"levelId"     dc:"关卡id"`
	ImgA        string `json:"imgA"        dc:"图片A的地址"`
	ImgB        string `json:"imgB"        dc:"图片B的地址"`
	Type        string `json:"type"        dc:"图片主题类型"`
	AnswerRects string `json:"answerRects" dc:"answer_rects"`
	Layout      int    `json:"layout"         dc:"0 左右 1 上下"`
	Desc        string `json:"desc"         dc:"描述"`
}

// GameDiffLevelConfigExportModel 导出找茬关卡配置表
type GameDiffLevelConfigExportModel struct {
	LevelId     int    `json:"levelId"     dc:"关卡id"`
	ImgA        string `json:"imgA"        dc:"图片A的地址"`
	ImgB        string `json:"imgB"        dc:"图片B的地址"`
	Type        string `json:"type"        dc:"图片主题类型"`
	AnswerRects string `json:"answerRects" dc:"answer_rects"`
	Layout      int    `json:"layout"         dc:"0 左右 1 上下"`
}
