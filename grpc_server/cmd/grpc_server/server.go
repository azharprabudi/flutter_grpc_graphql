package main

import (
	"fmt"
	"log"
	"net"

	"github.com/azharprabudi/flutter_grpc_graphql/grpc_server/configs"
	"github.com/azharprabudi/flutter_grpc_graphql/grpc_server/internal/grpc_server/utils"
	"google.golang.org/grpc"
)

func main() {
	address := fmt.Sprintf(":%d", configs.PORT)
	listener, err := net.Listen("tcp", address)
	if err != nil {
		log.Print(err)
	}

	server := grpc.NewServer()
	utils.RegisterServices(server)

	log.Printf("Your server already run at port %s", address)
	if err := server.Serve(listener); err != nil {
		log.Print(err)
	}
}
