// Package sys
// @Link  https://github.com/bufanyun/hotgo
// @Copyright  Copyright (c) 2023 HotGo CLI
// @Author  Ms <133814250@qq.com>
// @License  https://github.com/bufanyun/hotgo/blob/master/LICENSE
// @AutoGenerate Version 2.9.8
package sys

import (
	"bytes"
	"context"
	"fmt"
	"log"
	"os"
	"os/exec"
	"runtime"
	"strings"
	"text/template"

	"hotgo/api/admin/gameroute"
	"hotgo/internal/model/input/sysin"
	"hotgo/internal/service"
)

var (
	GameRoute = cGameRoute{}
)

type cGameRoute struct{}

// List 查看游戏路由列表
func (c *cGameRoute) List(ctx context.Context, req *gameroute.ListReq) (res *gameroute.ListRes, err error) {
	list, totalCount, err := service.SysGameRoute().List(ctx, &req.GameRouteListInp)
	if err != nil {
		return
	}

	res = new(gameroute.ListRes)
	res.List = list
	res.PageRes.Pack(req, totalCount)
	return
}

// Export 导出游戏路由列表
func (c *cGameRoute) Export(ctx context.Context, req *gameroute.ExportReq) (res *gameroute.ExportRes, err error) {
	err = service.SysGameRoute().Export(ctx, &req.GameRouteListInp)
	return
}

// Edit 更新游戏路由
func (c *cGameRoute) Edit(ctx context.Context, req *gameroute.EditReq) (res *gameroute.EditRes, err error) {
	err = service.SysGameRoute().Edit(ctx, &req.GameRouteEditInp)
	//proxyPool.Remove(req.GameRouteEditInp.FactoryType)
	ReloadRoute()

	return
}

// View 获取指定游戏路由信息
func (c *cGameRoute) View(ctx context.Context, req *gameroute.ViewReq) (res *gameroute.ViewRes, err error) {
	data, err := service.SysGameRoute().View(ctx, &req.GameRouteViewInp)
	if err != nil {
		return
	}

	res = new(gameroute.ViewRes)
	res.GameRouteViewModel = data
	return
}

// Delete 删除游戏路由
func (c *cGameRoute) Delete(ctx context.Context, req *gameroute.DeleteReq) (res *gameroute.DeleteRes, err error) {
	err = service.SysGameRoute().Delete(ctx, &req.GameRouteDeleteInp)
	//proxyPool.Remove(req.FactoryType)
	ReloadRoute()
	return
}

type Data struct {
	Data    []Item
	ZipData []Item
	Port    int
}

type Item struct {
	Name  string
	Addrs string
}

var tmpl *template.Template

func init() {
	var err error
	bs, err := os.ReadFile("./manifest/config/nginx.conf")
	if err != nil {
		panic(err)
	}
	tmpl, err = template.New("test").Parse(string(bs))
	if err != nil {
		panic(err)
	}

}
func ReloadRoute() {
	all, err := service.SysGameRoute().Model(context.TODO()).All()
	if err != nil {
		panic(err)
	}
	var list []*sysin.GameRouteListModel
	err = all.Structs(&list)
	if err != nil {
		panic(err)
	}
	err = makeConf(list)
	if err != nil {
		panic(err)

	}

}
func makeConf(conf []*sysin.GameRouteListModel) error {
	if len(conf) == 0 {
		return nil
	}
	//生成nginx配置文件
	data := &Data{
		Port:    4399,
		Data:    []Item{},
		ZipData: []Item{},
	}
	for _, route := range conf {
		if route.Url != "raw" {
			if strings.HasSuffix(route.FactoryType, ".zip") {
				data.ZipData = append(data.ZipData, Item{
					Name:  route.FactoryType,
					Addrs: route.Url,
				})
			} else {

				data.Data = append(data.Data, Item{
					Name:  route.FactoryType,
					Addrs: route.Url,
				})
			}

		}
	}

	var buf bytes.Buffer
	err := tmpl.Execute(&buf, data)
	if err != nil {
		return err
	}
	err = os.WriteFile("/home/ecs-user/.local/etc/nginx/sites-enabled/nginx.game.route.proxy.conf", buf.Bytes(), 0666)
	//err = os.WriteFile("/opt/homebrew/etc/nginx/conf.d/nginx.game.route.proxy.conf", buf.Bytes(), 0666)
	if err != nil {
		return err
	}
	//reload nginx
	//ubuntu 默认安装位置
	var cmd *exec.Cmd
	if runtime.GOOS == "darwin" {
		cmd = exec.Command("brew", "services", "reload", "nginx")
	} else if runtime.GOOS == "linux" {
		cmd = exec.Command("sudo", "/usr/sbin/nginx", "-s", "reload")
	} else {
		return fmt.Errorf("unknow os type")
	}
	out, err := cmd.CombinedOutput()
	if err != nil {
		return err
	}
	log.Println("nginx output\n", string(out))
	return nil
}
