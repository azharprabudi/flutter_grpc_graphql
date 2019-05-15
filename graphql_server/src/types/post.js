const PostType = `
    type Posts {
        posts: [Post]
    }

    type Post {
        userId: String
        id: Int
        title: String
        body: String
    }
`;

module.exports = PostType;
