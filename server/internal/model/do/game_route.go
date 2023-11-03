// =================================================================================
// Code generated and maintained by GoFrame CLI tool. DO NOT EDIT.
// =================================================================================

package do

import (
	"github.com/gogf/gf/v2/frame/g"
)

// GameRoute is the golang structure of table hg_game_route for DAO operations like Where/Data.
type GameRoute struct {
	g.Meta      `orm:"table:hg_game_route, do:true"`
	Id          interface{} //
	FactoryType interface{} // 房型
	Url         interface{} // 游戏地址
	Desc        interface{} // 描述
}
