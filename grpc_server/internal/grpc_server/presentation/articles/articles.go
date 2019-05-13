package presentation

import (
	"context"

	service "github.com/azharprabudi/flutter_grpc_graphql/grpc_server/internal/grpc_server/service/articles"
	"github.com/azharprabudi/flutter_grpc_graphql/grpc_server/pkg/api/v1/proto"
)

type ArticlePresentation struct {
	service service.ArticleServiceInterface
}

func (ap *ArticlePresentation) Get(context.Context, *proto.ArticlePagination) (*proto.Articles, error) {
	// articles
	return nil, nil
}

func (ap *ArticlePresentation) Bookmark(context.Context, *proto.Article) (*proto.Empty, error) {
	return nil, nil
}

func NewArticlePresentation() proto.ArticleServiceServer {
	return &ArticlePresentation{
		service: service.NewArticleService(),
	}
}
