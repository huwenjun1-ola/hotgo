// Package sys
// @Link  https://github.com/bufanyun/hotgo
// @Copyright  Copyright (c) 2023 HotGo CLI
// @Author  Ms <133814250@qq.com>
// @License  https://github.com/bufanyun/hotgo/blob/master/LICENSE
// @AutoGenerate Version 2.9.8
package sys

//
//var proxyPool = gmap.NewStrAnyMap(true)
//
//type GameReverseProxy struct {
//	*httputil.ReverseProxy
//	isDirect bool
//	url      *url.URL
//}
//
//// NewProxy takes target host and creates a reverse proxy
//func NewProxy(factoryType string, targetHost string, isDirect bool) (*GameReverseProxy, error) {
//	url, err := url.Parse(targetHost)
//	if err != nil {
//		return nil, err
//	}
//	p := &GameReverseProxy{isDirect: isDirect, url: url}
//	proxy := httputil.NewSingleHostReverseProxy(url)
//	p.ReverseProxy = proxy
//	originalDirector := proxy.Director
//	proxy.Director = func(req *http.Request) {
//		p.modifyRequest(factoryType, req)
//		originalDirector(req)
//		if p.isDirect {
//			req.URL = p.url
//		}
//	}
//
//	proxy.ModifyResponse = p.modifyResponse()
//	proxy.ErrorHandler = p.errorHandler()
//	return p, nil
//}
//
//func (p *GameReverseProxy) modifyRequest(factoryType string, req *http.Request) {
//	index := strings.Index(req.URL.Path, factoryType)
//	if index >= 0 {
//		req.URL.Path = req.URL.Path[index+len(factoryType):]
//		req.Header.Set("X-Proxy", "Simple-Reverse-Proxy")
//	}
//}
//
//func (p *GameReverseProxy) errorHandler() func(http.ResponseWriter, *http.Request, error) {
//	return func(w http.ResponseWriter, req *http.Request, err error) {
//		fmt.Printf("Got error while modifying response: %v \n", err)
//		return
//	}
//}
//
//func (p *GameReverseProxy) modifyResponse() func(*http.Response) error {
//	return func(resp *http.Response) error {
//		return nil
//		return errors.New("response body is invalid")
//	}
//}
//
//// ProxyRequestHandler handles the http request using proxy
//func ProxyRequestHandler(proxy *httputil.ReverseProxy) func(http.ResponseWriter, *http.Request) {
//	return func(w http.ResponseWriter, r *http.Request) {
//		proxy.ServeHTTP(w, r)
//	}
//}
//func route(w http.ResponseWriter, req *http.Request) {
//	path := req.URL.Path
//	path = path[1:]
//	if len(path) == 0 {
//		ctx := context.TODO()
//		ip, err := location.GetLocalIP()
//		if err != nil {
//			g.Log().Error(ctx, err)
//			return
//		}
//		http.Redirect(w, req, fmt.Sprintf("http://%s%s/web", ip, g.Cfg().MustGet(ctx, "server.address").String()), http.StatusFound)
//		return
//	}
//	index := strings.Index(path, "/")
//	var factoryType string
//	if index > 0 {
//		factoryType = path[:index]
//	} else {
//		factoryType = path
//	}
//	isRawDispatch := false
//	p := proxyPool.GetOrSetFunc(factoryType, func() interface{} {
//		data, err := service.SysGameRoute().GetGameRouteByFactory(context.TODO(), factoryType)
//		if err != nil || data == nil {
//			return nil
//		}
//		if data.Url == "raw" {
//			factoryType = req.URL.Path
//			isRawDispatch = true
//			return nil
//		}
//		proxy, err := NewProxy(factoryType, data.Url, false)
//		if err != nil {
//			panic(err)
//		}
//		return proxy
//	})
//	if isRawDispatch {
//		p = proxyPool.GetOrSetFunc(factoryType, func() interface{} {
//			data, err := service.SysGameRoute().GetGameRouteByFactory(context.TODO(), factoryType)
//			if err != nil || data == nil {
//				return nil
//			}
//			if data != nil {
//				proxy, err := NewProxy(factoryType, data.Url, true)
//				if err != nil {
//					panic(err)
//				}
//				return proxy
//			}
//			return nil
//		})
//	}
//
//	if p != nil {
//		proxy := p.(*GameReverseProxy)
//		proxy.ServeHTTP(w, req)
//
//	} else {
//		_, err := w.Write([]byte("请检查房型是否正确或存在"))
//		if err != nil {
//			return
//		}
//	}
//
//}

func LanuchGameRouteServer() {
	// initialize a reverse proxy and pass the actual backend server url here

	// handle all requests to your server using the proxy
	//http.HandleFunc("/", route)
	//address := g.Cfg().MustGet(context.TODO(), "server.RouteMapAddress").String()
	//log.Fatal(http.ListenAndServe(address, nil))
	ReloadRoute()
}
