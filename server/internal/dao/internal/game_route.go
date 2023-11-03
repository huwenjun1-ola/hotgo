// ==========================================================================
// Code generated and maintained by GoFrame CLI tool. DO NOT EDIT.
// ==========================================================================

package internal

import (
	"context"

	"github.com/gogf/gf/v2/database/gdb"
	"github.com/gogf/gf/v2/frame/g"
)

// GameRouteDao is the data access object for table hg_game_route.
type GameRouteDao struct {
	table   string           // table is the underlying table name of the DAO.
	group   string           // group is the database configuration group name of current DAO.
	columns GameRouteColumns // columns contains all the column names of Table for convenient usage.
}

// GameRouteColumns defines and stores column names for table hg_game_route.
type GameRouteColumns struct {
	Id          string //
	FactoryType string // 房型
	Url         string // 游戏地址
	Desc        string // 描述
}

// gameRouteColumns holds the columns for table hg_game_route.
var gameRouteColumns = GameRouteColumns{
	Id:          "id",
	FactoryType: "factory_type",
	Url:         "url",
	Desc:        "desc",
}

// NewGameRouteDao creates and returns a new DAO object for table data access.
func NewGameRouteDao() *GameRouteDao {
	return &GameRouteDao{
		group:   "default",
		table:   "hg_game_route",
		columns: gameRouteColumns,
	}
}

// DB retrieves and returns the underlying raw database management object of current DAO.
func (dao *GameRouteDao) DB() gdb.DB {
	return g.DB(dao.group)
}

// Table returns the table name of current dao.
func (dao *GameRouteDao) Table() string {
	return dao.table
}

// Columns returns all column names of current dao.
func (dao *GameRouteDao) Columns() GameRouteColumns {
	return dao.columns
}

// Group returns the configuration group name of database of current dao.
func (dao *GameRouteDao) Group() string {
	return dao.group
}

// Ctx creates and returns the Model for current DAO, It automatically sets the context for current operation.
func (dao *GameRouteDao) Ctx(ctx context.Context) *gdb.Model {
	return dao.DB().Model(dao.table).Safe().Ctx(ctx)
}

// Transaction wraps the transaction logic using function f.
// It rollbacks the transaction and returns the error from function f if it returns non-nil error.
// It commits the transaction and returns nil if function f returns nil.
//
// Note that, you should not Commit or Rollback the transaction in function f
// as it is automatically handled by this function.
func (dao *GameRouteDao) Transaction(ctx context.Context, f func(ctx context.Context, tx gdb.TX) error) (err error) {
	return dao.Ctx(ctx).Transaction(ctx, f)
}
