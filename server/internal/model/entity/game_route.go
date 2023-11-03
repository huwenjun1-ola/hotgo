// =================================================================================
// Code generated and maintained by GoFrame CLI tool. DO NOT EDIT.
// =================================================================================

package entity

// GameRoute is the golang structure for table game_route.
type GameRoute struct {
	Id          int    `json:"id"          description:""`
	FactoryType string `json:"factoryType" description:"房型"`
	Url         string `json:"url"         description:"游戏地址"`
	Desc        string `json:"desc"        description:"描述"`
}
