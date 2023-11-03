// Package sys
// @Link  https://github.com/bufanyun/hotgo
// @Copyright  Copyright (c) 2023 HotGo CLI
// @Author  Ms <133814250@qq.com>
// @License  https://github.com/bufanyun/hotgo/blob/master/LICENSE
// @AutoGenerate Version 2.9.8
package sys

import (
	"context"
	"fmt"

	"hotgo/internal/dao"
	"hotgo/internal/library/hgorm"
	"hotgo/internal/library/hgorm/handler"
	"hotgo/internal/model/input/form"
	"hotgo/internal/model/input/sysin"
	"hotgo/internal/service"
	"hotgo/utility/convert"
	"hotgo/utility/excel"

	"github.com/gogf/gf/v2/database/gdb"
	"github.com/gogf/gf/v2/errors/gerror"
	"github.com/gogf/gf/v2/frame/g"
	"github.com/gogf/gf/v2/os/gctx"
	"github.com/gogf/gf/v2/util/gconv"
)

type sSysGameRoute struct{}

func NewSysGameRoute() *sSysGameRoute {
	return &sSysGameRoute{}
}

func init() {
	service.RegisterSysGameRoute(NewSysGameRoute())
}

// Model 游戏路由ORM模型
func (s *sSysGameRoute) Model(ctx context.Context, option ...*handler.Option) *gdb.Model {
	return handler.Model(dao.GameRoute.Ctx(ctx), option...)
}

// List 获取游戏路由列表
func (s *sSysGameRoute) List(ctx context.Context, in *sysin.GameRouteListInp) (list []*sysin.GameRouteListModel, totalCount int, err error) {
	mod := s.Model(ctx)

	// 查询房型
	if in.FactoryType != "" {
		mod = mod.WhereLike(dao.GameRoute.Columns().FactoryType, in.FactoryType)
	}

	totalCount, err = mod.Clone().Count()
	if err != nil {
		err = gerror.Wrap(err, "获取游戏路由数据行失败，请稍后重试！")
		return
	}

	if totalCount == 0 {
		return
	}

	if err = mod.Fields(sysin.GameRouteListModel{}).Page(in.Page, in.PerPage).OrderDesc(dao.GameRoute.Columns().Id).Scan(&list); err != nil {
		err = gerror.Wrap(err, "获取游戏路由列表失败，请稍后重试！")
		return
	}
	return
}

// Export 导出游戏路由
func (s *sSysGameRoute) Export(ctx context.Context, in *sysin.GameRouteListInp) (err error) {
	list, totalCount, err := s.List(ctx, in)
	if err != nil {
		return
	}

	// 字段的排序是依据tags的字段顺序，如果你不想使用默认的排序方式，可以直接定义 tags = []string{"字段名称", "字段名称2", ...}
	tags, err := convert.GetEntityDescTags(sysin.GameRouteExportModel{})
	if err != nil {
		return
	}

	var (
		fileName  = "导出游戏路由-" + gctx.CtxId(ctx) + ".xlsx"
		sheetName = fmt.Sprintf("索引条件共%v行,共%v页,当前导出是第%v页,本页共%v行", totalCount, form.CalPageCount(totalCount, in.PerPage), in.Page, len(list))
		exports   []sysin.GameRouteExportModel
	)

	if err = gconv.Scan(list, &exports); err != nil {
		return
	}

	err = excel.ExportByStructs(ctx, tags, exports, fileName, sheetName)
	return
}

// Edit 修改/新增游戏路由
func (s *sSysGameRoute) Edit(ctx context.Context, in *sysin.GameRouteEditInp) (err error) {
	// 验证'FactoryType'唯一
	if err = hgorm.IsUnique(ctx, &dao.GameRoute, g.Map{dao.GameRoute.Columns().FactoryType: in.FactoryType}, "房型已存在", in.Id); err != nil {
		return
	}
	// 修改
	if in.Id > 0 {
		if _, err = s.Model(ctx).
			Fields(sysin.GameRouteUpdateFields{}).
			WherePri(in.Id).Data(in).Update(); err != nil {
			err = gerror.Wrap(err, "修改游戏路由失败，请稍后重试！")
		}
		return
	}

	// 新增
	if _, err = s.Model(ctx, &handler.Option{FilterAuth: false}).
		Fields(sysin.GameRouteInsertFields{}).
		Data(in).Insert(); err != nil {
		err = gerror.Wrap(err, "新增游戏路由失败，请稍后重试！")
	}
	return
}

// Delete 删除游戏路由
func (s *sSysGameRoute) Delete(ctx context.Context, in *sysin.GameRouteDeleteInp) (err error) {
	if _, err = s.Model(ctx).WherePri(in.Id).Delete(); err != nil {
		err = gerror.Wrap(err, "删除游戏路由失败，请稍后重试！")
		return
	}
	return
}

// View 获取游戏路由指定信息
func (s *sSysGameRoute) View(ctx context.Context, in *sysin.GameRouteViewInp) (res *sysin.GameRouteViewModel, err error) {
	if err = s.Model(ctx).WherePri(in.Id).Scan(&res); err != nil {
		err = gerror.Wrap(err, "获取游戏路由信息，请稍后重试！")
		return
	}
	return
}

// List 获取游戏路由列表
func (s *sSysGameRoute) GetGameRouteByFactory(ctx context.Context, factoryType string) (model *sysin.GameRouteListModel, err error) {
	mod := s.Model(ctx)
	// 查询房型
	mod = mod.Where(dao.GameRoute.Columns().FactoryType, factoryType)

	if err = mod.Fields(sysin.GameRouteListModel{}).Scan(&model); err != nil {
		err = gerror.Wrap(err, "获取游戏路由列表失败，请稍后重试！")
		return
	}
	return
}
