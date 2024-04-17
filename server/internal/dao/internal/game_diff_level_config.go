// ==========================================================================
// Code generated and maintained by GoFrame CLI tool. DO NOT EDIT.
// ==========================================================================

package internal

import (
	"context"

	"github.com/gogf/gf/v2/database/gdb"
	"github.com/gogf/gf/v2/frame/g"
)

// GameDiffLevelConfigDao is the data access object for table hg_game_diff_level_config.
type GameDiffLevelConfigDao struct {
	table   string                     // table is the underlying table name of the DAO.
	group   string                     // group is the database configuration group name of current DAO.
	columns GameDiffLevelConfigColumns // columns contains all the column names of Table for convenient usage.
}

// GameDiffLevelConfigColumns defines and stores column names for table hg_game_diff_level_config.
type GameDiffLevelConfigColumns struct {
	LevelId     string // 关卡id
	ImgA        string // 图片A的地址
	ImgB        string // 图片B的地址
	Type        string // 图片主题类型
	AnswerRects string //
	Dir         string // 0 左右 1 上下
	Desc        string // 描述字段，用于内部区分
}

// gameDiffLevelConfigColumns holds the columns for table hg_game_diff_level_config.
var gameDiffLevelConfigColumns = GameDiffLevelConfigColumns{
	LevelId:     "level_id",
	ImgA:        "img_a",
	ImgB:        "img_b",
	Type:        "type",
	AnswerRects: "answer_rects",
	Dir:         "dir",
	Desc:        "desc",
}

// NewGameDiffLevelConfigDao creates and returns a new DAO object for table data access.
func NewGameDiffLevelConfigDao() *GameDiffLevelConfigDao {
	return &GameDiffLevelConfigDao{
		group:   "default",
		table:   "hg_game_diff_level_config",
		columns: gameDiffLevelConfigColumns,
	}
}

// DB retrieves and returns the underlying raw database management object of current DAO.
func (dao *GameDiffLevelConfigDao) DB() gdb.DB {
	return g.DB(dao.group)
}

// Table returns the table name of current dao.
func (dao *GameDiffLevelConfigDao) Table() string {
	return dao.table
}

// Columns returns all column names of current dao.
func (dao *GameDiffLevelConfigDao) Columns() GameDiffLevelConfigColumns {
	return dao.columns
}

// Group returns the configuration group name of database of current dao.
func (dao *GameDiffLevelConfigDao) Group() string {
	return dao.group
}

// Ctx creates and returns the Model for current DAO, It automatically sets the context for current operation.
func (dao *GameDiffLevelConfigDao) Ctx(ctx context.Context) *gdb.Model {
	return dao.DB().Model(dao.table).Safe().Ctx(ctx)
}

// Transaction wraps the transaction logic using function f.
// It rollbacks the transaction and returns the error from function f if it returns non-nil error.
// It commits the transaction and returns nil if function f returns nil.
//
// Note that, you should not Commit or Rollback the transaction in function f
// as it is automatically handled by this function.
func (dao *GameDiffLevelConfigDao) Transaction(ctx context.Context, f func(ctx context.Context, tx gdb.TX) error) (err error) {
	return dao.Ctx(ctx).Transaction(ctx, f)
}
