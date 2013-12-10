package main

import (
	"github.com/kentaro/delta"
	"net/http"
)

func main() {
	server := delta.NewServer("0.0.0.0", 8080)

	server.AddMasterBackend("production", "127.0.0.1", 8081)
	server.AddBackend("sandbox", "127.0.0.1", 8082)

	server.OnSelectBackend(func(req *http.Request) []string {
		return []string{"production", "sandbox"}
	})

	server.Run()
}
