const Query = `
    type Query {
        articles(page: Int): Articles,
        articles_grpc(page: Int): Articles
        posts: [Post]
        post(id: Int): Post
    }
`;

module.exports = Query;
