package service

import (
	"encoding/json"
	"strconv"

	"github.com/azharprabudi/flutter_grpc_graphql/grpc_server/configs"
	"github.com/azharprabudi/flutter_grpc_graphql/grpc_server/pkg/api/v1/proto"
	"github.com/payfazz/go-apt/pkg/fazzcloud"
)

type ArticleService struct {
	http *fazzcloud.HTTPClient
}

type ArticleServiceInterface interface {
	Get(page int) (*proto.Articles, error)
}

func (as *ArticleService) Get(page int) (*proto.Articles, error) {
	_, resp, err := as.http.Get("/top-headlines", &map[string]string{
		"category":       "sports",
		"country": "id",
		"apiKey":  configs.API_KEY,
		"page":    strconv.Itoa(page),
		"pageSize": "10",
	}, nil)
	if err != nil {
		return nil, err
	}

	var articles *proto.Articles
	if err = json.Unmarshal(resp, &articles); err != nil {
		return nil, err
	}

	return articles, nil
}

func NewArticleService() ArticleServiceInterface {
	return &ArticleService{
		http: fazzcloud.NewHTTPClient(configs.BASEURL_ARTICLES),
	}
}
