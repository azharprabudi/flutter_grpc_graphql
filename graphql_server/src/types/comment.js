const CommentType = `
    type Comments {
        comments: [Comment]
    }

    type Comment {
        postId: Int
        id: Int
        name: String
        email: String
        body: String
    }
`;

module.exports = CommentType;
