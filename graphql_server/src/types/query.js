const Query = `
    type Query {
        articles(page: Int): Articles
    }
`;

module.exports = Query;
