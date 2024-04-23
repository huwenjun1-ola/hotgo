// =================================================================================
// This is auto-generated by GoFrame CLI tool only once. Fill this file as you wish.
// =================================================================================

package dao

import (
	"hotgo/internal/dao/internal"
)

// internalGameDiffLevelConfigDao is internal type for wrapping internal DAO implements.
type internalGameDiffLevelConfigDao = *internal.GameDiffLevelConfigDao

// gameDiffLevelConfigDao is the data access object for table hg_game_diff_level_config.
// You can define custom methods on it to extend its functionality as you wish.
type gameDiffLevelConfigDao struct {
	internalGameDiffLevelConfigDao
}

var (
	// GameDiffLevelConfig is globally public accessible object for table hg_game_diff_level_config operations.
	GameDiffLevelConfig = gameDiffLevelConfigDao{
		internal.NewGameDiffLevelConfigDao(),
	}
)

// Fill with you ideas below.