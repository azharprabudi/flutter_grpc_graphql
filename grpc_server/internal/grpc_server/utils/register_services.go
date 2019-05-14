package utils

import (
	p1 "github.com/azharprabudi/flutter_grpc_graphql/grpc_server/internal/grpc_server/presentation/articles"
	p2 "github.com/azharprabudi/flutter_grpc_graphql/grpc_server/internal/grpc_server/presentation/chat"
	"github.com/azharprabudi/flutter_grpc_graphql/grpc_server/pkg/api/v1/proto"
	"google.golang.org/grpc"
	"google.golang.org/grpc/reflection"
)

func RegisterServices(server *grpc.Server) {
	article := p1.NewArticlePresentation()
	proto.RegisterArticleServiceServer(server, article)

	chat := p2.NewChatPresentation()
	proto.RegisterChatServiceServer(server, chat)

	reflection.Register(server)
}
