const ArticleType = `
    type Articles {
        status: String
        totalResults: Int
        articles: [Article]
    }

    type Article {
        source: ArticleSource
        author: String
        title: String
        description: String
        url: String
        urlToImage: String
        publishedAt: String
        content: String
    }

    type ArticleSource {
        id: String
        name: String
    }

    type ArticlePagination {
        page: Int
    }
`;

module.exports = ArticleType;
