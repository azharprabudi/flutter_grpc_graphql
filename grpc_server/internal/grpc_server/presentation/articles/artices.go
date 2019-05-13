package presentation

import (
	"context"

	"github.com/azharprabudi/flutter_grpc_graphql/grpc_server/pkg/api/v1/proto"
)

type ArticlePresentation struct {
}

func (ap *ArticlePresentation) Get(context.Context, *proto.ArticlePagination) (*proto.Articles, error) {
	return nil, nil
}

func (ap *ArticlePresentation) Bookmark(context.Context, *proto.Article) (*proto.Empty, error) {
	return nil, nil
}

func NewArticlePresentation() proto.ArticleServiceServer {
	return &ArticlePresentation{}
}
