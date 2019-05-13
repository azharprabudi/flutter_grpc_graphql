package presentation

import (
	"context"

	service "github.com/azharprabudi/flutter_grpc_graphql/grpc_server/internal/grpc_server/service/articles"
	"github.com/azharprabudi/flutter_grpc_graphql/grpc_server/pkg/api/v1/proto"
)

type ArticlePresentation struct {
	service service.ArticleServiceInterface
}

func (ap *ArticlePresentation) Get(ctx context.Context, req *proto.ArticlePagination) (*proto.Articles, error) {
	page := int(req.Page)
	resp, err := ap.service.Get(page)
	if err != nil {
		return nil, err
	}

	return resp, nil
}

func (ap *ArticlePresentation) Bookmark(ctx context.Context, req *proto.Article) (*proto.Empty, error) {
	return nil, nil
}

func NewArticlePresentation() proto.ArticleServiceServer {
	return &ArticlePresentation{
		service: service.NewArticleService(),
	}
}
