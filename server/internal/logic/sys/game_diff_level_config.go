// Package sys
// @Link  https://github.com/bufanyun/hotgo
// @Copyright  Copyright (c) 2024 HotGo CLI
// @Author  Ms <133814250@qq.com>
// @License  https://github.com/bufanyun/hotgo/blob/master/LICENSE
// @AutoGenerate Version 2.9.8
package sys

import (
	"context"
	"fmt"

	"hotgo/internal/dao"
	"hotgo/internal/library/hgorm/handler"
	"hotgo/internal/model/input/form"
	"hotgo/internal/model/input/sysin"
	"hotgo/internal/service"
	"hotgo/utility/convert"
	"hotgo/utility/excel"

	"github.com/gogf/gf/v2/database/gdb"
	"github.com/gogf/gf/v2/errors/gerror"
	"github.com/gogf/gf/v2/os/gctx"
	"github.com/gogf/gf/v2/util/gconv"
)

type sSysGameDiffLevelConfig struct{}

func NewSysGameDiffLevelConfig() *sSysGameDiffLevelConfig {
	return &sSysGameDiffLevelConfig{}
}

func init() {
	service.RegisterSysGameDiffLevelConfig(NewSysGameDiffLevelConfig())
}

// Model 找茬关卡配置表ORM模型
func (s *sSysGameDiffLevelConfig) Model(ctx context.Context, option ...*handler.Option) *gdb.Model {
	return handler.Model(dao.GameDiffLevelConfig.Ctx(ctx), option...)
}

// List 获取找茬关卡配置表列表
func (s *sSysGameDiffLevelConfig) List(ctx context.Context, in *sysin.GameDiffLevelConfigListInp) (list []*sysin.GameDiffLevelConfigListModel, totalCount int, err error) {
	mod := s.Model(ctx)

	// 查询关卡id
	if in.LevelId > 0 {
		mod = mod.Where(dao.GameDiffLevelConfig.Columns().LevelId, in.LevelId)
	}
	if in.Type != "" {
		mod = mod.Where(dao.GameDiffLevelConfig.Columns().Type, in.Type)
	}
	totalCount, err = mod.Clone().Count()
	if err != nil {
		err = gerror.Wrap(err, "获取找茬关卡配置表数据行失败，请稍后重试！")
		return
	}

	if totalCount == 0 {
		return
	}

	if err = mod.Fields(sysin.GameDiffLevelConfigListModel{}).Page(in.Page, in.PerPage).OrderDesc(dao.GameDiffLevelConfig.Columns().LevelId).Scan(&list); err != nil {
		err = gerror.Wrap(err, "获取找茬关卡配置表列表失败，请稍后重试！")
		return
	}
	return
}

// Export 导出找茬关卡配置表
func (s *sSysGameDiffLevelConfig) Export(ctx context.Context, in *sysin.GameDiffLevelConfigListInp) (err error) {
	list, totalCount, err := s.List(ctx, in)
	if err != nil {
		return
	}

	// 字段的排序是依据tags的字段顺序，如果你不想使用默认的排序方式，可以直接定义 tags = []string{"字段名称", "字段名称2", ...}
	tags, err := convert.GetEntityDescTags(sysin.GameDiffLevelConfigExportModel{})
	if err != nil {
		return
	}

	var (
		fileName  = "导出找茬关卡配置表-" + gctx.CtxId(ctx) + ".xlsx"
		sheetName = fmt.Sprintf("索引条件共%v行,共%v页,当前导出是第%v页,本页共%v行", totalCount, form.CalPageCount(totalCount, in.PerPage), in.Page, len(list))
		exports   []sysin.GameDiffLevelConfigExportModel
	)

	if err = gconv.Scan(list, &exports); err != nil {
		return
	}

	err = excel.ExportByStructs(ctx, tags, exports, fileName, sheetName)
	return
}

// Edit 修改/新增找茬关卡配置表
func (s *sSysGameDiffLevelConfig) Edit(ctx context.Context, in *sysin.GameDiffLevelConfigEditInp) (err error) {
	// 修改
	if in.LevelId > 0 {
		if _, err = s.Model(ctx).
			Fields(sysin.GameDiffLevelConfigUpdateFields{}).
			WherePri(in.LevelId).Data(in).Update(); err != nil {
			err = gerror.Wrap(err, "修改找茬关卡配置表失败，请稍后重试！")
		}
		return
	}

	// 新增
	if _, err = s.Model(ctx, &handler.Option{FilterAuth: false}).
		Fields(sysin.GameDiffLevelConfigInsertFields{}).
		Data(in).Insert(); err != nil {
		err = gerror.Wrap(err, "新增找茬关卡配置表失败，请稍后重试！")
	}
	return
}

// Delete 删除找茬关卡配置表
func (s *sSysGameDiffLevelConfig) Delete(ctx context.Context, in *sysin.GameDiffLevelConfigDeleteInp) (err error) {
	if _, err = s.Model(ctx).WherePri(in.LevelId).Delete(); err != nil {
		err = gerror.Wrap(err, "删除找茬关卡配置表失败，请稍后重试！")
		return
	}
	return
}

// View 获取找茬关卡配置表指定信息
func (s *sSysGameDiffLevelConfig) View(ctx context.Context, in *sysin.GameDiffLevelConfigViewInp) (res *sysin.GameDiffLevelConfigViewModel, err error) {
	if err = s.Model(ctx).WherePri(in.LevelId).Scan(&res); err != nil {
		err = gerror.Wrap(err, "获取找茬关卡配置表信息，请稍后重试！")
		return
	}
	return
}
