// Package sys
// @Link  https://github.com/bufanyun/hotgo
// @Copyright  Copyright (c) 2023 HotGo CLI
// @Author  Ms <133814250@qq.com>
// @License  https://github.com/bufanyun/hotgo/blob/master/LICENSE
// @AutoGenerate Version 2.9.8
package sys

import (
	"context"
	"errors"
	"fmt"
	"log"
	"net/http"
	"net/http/httputil"
	"net/url"
	"strings"

	"github.com/gogf/gf/v2/container/gmap"
	"github.com/gogf/gf/v2/frame/g"
	"hotgo/internal/library/location"
	"hotgo/internal/service"
)

var proxyPool = gmap.NewStrAnyMap(true)

// NewProxy takes target host and creates a reverse proxy
func NewProxy(factoryType string, targetHost string) (*httputil.ReverseProxy, error) {
	url, err := url.Parse(targetHost)
	if err != nil {
		return nil, err
	}

	proxy := httputil.NewSingleHostReverseProxy(url)

	originalDirector := proxy.Director
	proxy.Director = func(req *http.Request) {
		originalDirector(req)
		modifyRequest(factoryType, req)
	}

	proxy.ModifyResponse = modifyResponse()
	proxy.ErrorHandler = errorHandler()
	return proxy, nil
}

func modifyRequest(factoryType string, req *http.Request) {
	req.URL.Path = strings.Replace(req.URL.Path, fmt.Sprintf("%s/", factoryType), "", 1)

	req.Header.Set("X-Proxy", "Simple-Reverse-Proxy")
}

func errorHandler() func(http.ResponseWriter, *http.Request, error) {
	return func(w http.ResponseWriter, req *http.Request, err error) {
		fmt.Printf("Got error while modifying response: %v \n", err)
		return
	}
}

func modifyResponse() func(*http.Response) error {
	return func(resp *http.Response) error {
		return nil
		return errors.New("response body is invalid")
	}
}

// ProxyRequestHandler handles the http request using proxy
func ProxyRequestHandler(proxy *httputil.ReverseProxy) func(http.ResponseWriter, *http.Request) {
	return func(w http.ResponseWriter, r *http.Request) {
		proxy.ServeHTTP(w, r)
	}
}
func route(w http.ResponseWriter, req *http.Request) {
	path := req.URL.Path
	path = path[1:]
	if len(path) == 0 {
		ctx := context.TODO()
		ip, err := location.GetLocalIP()
		if err != nil {
			g.Log().Error(ctx, err)
			return
		}
		http.Redirect(w, req, fmt.Sprintf("http://%s%s/home", ip, g.Cfg().MustGet(ctx, "server.address").String()), http.StatusFound)
		return
	}
	factoryType := path[:strings.Index(path, "/")]
	p := proxyPool.GetOrSetFunc(factoryType, func() interface{} {
		data, err := service.SysGameRoute().GetGameRouteByFactory(context.TODO(), factoryType)
		if err != nil || data == nil {
			return nil
		}
		if data != nil {
			proxy, err := NewProxy(factoryType, data.Url)
			if err != nil {
				panic(err)
			}
			return proxy
		}
		return nil
	})
	if p != nil {
		proxy := p.(*httputil.ReverseProxy)
		proxy.ServeHTTP(w, req)

	} else {
		_, err := w.Write([]byte("请检查房型是否正确或存在"))
		if err != nil {
			return
		}
	}

}

func LanuchGameRouteServer() {
	// initialize a reverse proxy and pass the actual backend server url here

	// handle all requests to your server using the proxy
	http.HandleFunc("/", route)
	address := g.Cfg().MustGet(context.TODO(), "server.RouteMapAddress").String()
	log.Fatal(http.ListenAndServe(address, nil))
}
