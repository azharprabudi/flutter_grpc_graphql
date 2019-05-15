const Query = `
    type Query {
        articles(page: Int): Articles,
        articles_grpc(page: Int): Articles
    }
`;

module.exports = Query;
