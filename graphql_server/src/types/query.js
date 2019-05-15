const Query = `
    type Query {
        articles: (ArticlePagination) => Articles
    }
`;

module.exports = Query;
