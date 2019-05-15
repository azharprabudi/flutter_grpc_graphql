const PostType = `
    type Post {
        userId: String
        id: Int
        title: String
        body: String
        comments: [Comment]
    }
`;

module.exports = PostType;
