const resolvers = ({ articleGRPC }) => ({
  Query: {
    articles: async (_, { page }, { dataSources: { articleAPI } }) => {
      return await articleAPI.getArticle(page);
    },
    articles_grpc: async (_, { page }) => {
      return await articleGRPC.get(page);
    },
    posts: async (_, __, { dataSources: { postAPI } }) => {
      return await postAPI.getPosts();
    },
    post: async (_, { id }, { dataSources: { postAPI } }) => {
      return await postAPI.getPost(id);
    }
  },
  Post: {
    comments: async ({ id: postId }, _, { dataSources: { commentAPI } }) => {
      return await commentAPI.getComments(postId);
    }
  }
});

module.exports = resolvers;
