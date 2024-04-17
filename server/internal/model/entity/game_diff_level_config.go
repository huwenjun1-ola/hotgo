// =================================================================================
// Code generated and maintained by GoFrame CLI tool. DO NOT EDIT.
// =================================================================================

package entity

// GameDiffLevelConfig is the golang structure for table game_diff_level_config.
type GameDiffLevelConfig struct {
	LevelId     int    `json:"levelId"     description:"关卡id"`
	ImgA        string `json:"imgA"        description:"图片A的地址"`
	ImgB        string `json:"imgB"        description:"图片B的地址"`
	Type        string `json:"type"        description:"图片主题类型"`
	AnswerRects string `json:"answerRects" description:""`
	Dir         string `json:"dir"         description:"0 左右 1 上下"`
}
