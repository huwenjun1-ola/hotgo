// Package sys
// @Link  https://github.com/bufanyun/hotgo
// @Copyright  Copyright (c) 2024 HotGo CLI
// @Author  Ms <133814250@qq.com>
// @License  https://github.com/bufanyun/hotgo/blob/master/LICENSE
// @AutoGenerate Version 2.9.8
package sys

import (
	"context"
	"encoding/json"
	"fmt"
	"net/url"
	"time"

	"github.com/gogf/gf/v2/database/gdb"
	"github.com/gogf/gf/v2/errors/gcode"
	"github.com/gogf/gf/v2/errors/gerror"
	"github.com/gogf/gf/v2/net/ghttp"
	"github.com/gogf/gf/v2/os/gctx"
	"hotgo/internal/dao"
	"hotgo/internal/library/contexts"
	"hotgo/internal/library/hgorm/handler"
	"hotgo/internal/model"
	"hotgo/internal/model/input/sysin"
	"hotgo/internal/service"
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
	if in.PerPage < 0 {
		if err = mod.Fields(sysin.GameDiffLevelConfigListModel{}).OrderDesc(dao.GameDiffLevelConfig.Columns().LevelId).Scan(&list); err != nil {
			err = gerror.Wrap(err, "获取找茬关卡配置表列表失败，请稍后重试！")
			return
		}
	} else {
		if err = mod.Fields(sysin.GameDiffLevelConfigListModel{}).Page(in.Page, in.PerPage).OrderDesc(dao.GameDiffLevelConfig.Columns().LevelId).Scan(&list); err != nil {
			err = gerror.Wrap(err, "获取找茬关卡配置表列表失败，请稍后重试！")
			return
		}
	}

	return
}

// Export 导出找茬关卡配置表
func (s *sSysGameDiffLevelConfig) Export(ctx context.Context, in *sysin.GameDiffLevelConfigListInp) (err error) {
	in.PerPage = -1
	list, _, err := s.List(ctx, in)
	if err != nil {
		return
	}

	// 字段的排序是依据tags的字段顺序，如果你不想使用默认的排序方式，可以直接定义 tags = []string{"字段名称", "字段名称2", ...}
	if err != nil {
		return
	}

	var (
		fileName = "LevelConfig"
	)

	data := make(map[int]sysin.GameDiffLevelConfigExportModel)
	for _, cfgModel := range list {
		exportModel := sysin.GameDiffLevelConfigExportModel{
			LevelId: cfgModel.LevelId,
			ImgA:    cfgModel.ImgA,
			ImgB:    cfgModel.ImgB,
			Type:    cfgModel.Type,
			Layout:  cfgModel.Layout,
		}
		err := json.Unmarshal([]byte(cfgModel.AnswerRects), &exportModel.AnswerRects)
		if err != nil {
			panic(err)
		}
		data[cfgModel.LevelId] = exportModel
	}
	bytes, err := json.MarshalIndent(data, "", "\t")
	if err != nil {
		return err
	}
	// 强转类型
	writer := ghttp.RequestFromCtx(ctx).Response.Writer
	w, ok := interface{}(writer).(*ghttp.ResponseWriter)
	if !ok {
		return gerror.New("Response.Writer uninitialized!")
	}
	w.Header().Set("Content-Type", "application/octet-stream")
	w.Header().Set("Content-Disposition", fmt.Sprintf("attachment; filename=%s.json", url.QueryEscape(fileName)))
	w.Header().Set("Content-Transfer-Encoding", "binary")
	w.Header().Set("Access-Control-Expose-Headers", "Content-Disposition")
	_, err = w.Write(bytes)
	if err != nil {
		return err
	}

	// 加入到上下文
	contexts.SetResponse(ctx, &model.Response{
		Code:      gcode.CodeOK.Code(),
		Message:   "export successfully!",
		Timestamp: time.Now().Unix(),
		TraceID:   gctx.CtxId(ctx),
	})
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
