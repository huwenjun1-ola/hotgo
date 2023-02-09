// =================================================================================
// This is auto-generated by GoFrame CLI tool only once. Fill this file as you wish.
// =================================================================================

package dao

import (
	"context"
	"github.com/gogf/gf/v2/os/gtime"
	"hotgo/internal/dao/internal"
)

// internalSysEmsLogDao is internal type for wrapping internal DAO implements.
type internalSysEmsLogDao = *internal.SysEmsLogDao

// sysEmsLogDao is the data access object for table hg_sys_ems_log.
// You can define custom methods on it to extend its functionality as you wish.
type sysEmsLogDao struct {
	internalSysEmsLogDao
}

var (
	// SysEmsLog is globally public accessible object for table hg_sys_ems_log operations.
	SysEmsLog = sysEmsLogDao{
		internal.NewSysEmsLogDao(),
	}
)

// Fill with you ideas below.

// NowDayCount 当天发送次数
func (dao *sysEmsLogDao) NowDayCount(ctx context.Context, event, email string) (count int, err error) {
	count, err = dao.Ctx(ctx).
		Where("email", email).
		Where("event", event).
		WhereGTE("created_at", gtime.Now().Format("Y-m-d")).
		Count()
	if err != nil {
		return 0, err
	}

	return
}