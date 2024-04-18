// =================================================================================
// Code generated and maintained by GoFrame CLI tool. DO NOT EDIT.
// =================================================================================

package entity

// GameDiffLevelConfig is the golang structure for table game_diff_level_config.
type GameDiffLevelConfig struct {
	LevelId     int    `json:"levelId"     description:"关卡id"`
	ImgA        string `json:"imgA"        description:"原图的地址"`
	ImgB        string `json:"imgB"        description:"对比图的地址"`
	Type        string `json:"type"        description:"图片主题类型"`
	AnswerRects string `json:"answerRects" description:""`
	Layout      int    `json:"layout"      description:"布局 0 左右 1 上下"`
	Desc        string `json:"desc"        description:"描述字段，用于内部区分"`
}
