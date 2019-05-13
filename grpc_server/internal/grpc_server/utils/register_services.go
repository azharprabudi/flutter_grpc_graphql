package utils

import (
	presentation "github.com/azharprabudi/flutter_grpc_graphql/grpc_server/internal/grpc_server/presentation/articles"
	"github.com/azharprabudi/flutter_grpc_graphql/grpc_server/pkg/api/v1/proto"
	"google.golang.org/grpc"
	"google.golang.org/grpc/reflection"
)

func RegisterServices(server *grpc.Server) {
	article := presentation.NewArticlePresentation()
	proto.RegisterArticleServiceServer(server, article)

	reflection.Register(server)
}
