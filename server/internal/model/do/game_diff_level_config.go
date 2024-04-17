// =================================================================================
// Code generated and maintained by GoFrame CLI tool. DO NOT EDIT.
// =================================================================================

package do

import (
	"github.com/gogf/gf/v2/frame/g"
)

// GameDiffLevelConfig is the golang structure of table hg_game_diff_level_config for DAO operations like Where/Data.
type GameDiffLevelConfig struct {
	g.Meta      `orm:"table:hg_game_diff_level_config, do:true"`
	LevelId     interface{} // 关卡id
	ImgA        interface{} // 图片A的地址
	ImgB        interface{} // 图片B的地址
	Type        interface{} // 图片主题类型
	AnswerRects interface{} //
	Dir         interface{} // 0 左右 1 上下
}
