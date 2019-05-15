const resolvers = ({ articleGRPC }) => ({
  Query: {
    articles: async (_, { page }, { dataSources: { articleAPI } }) => {
      return await articleAPI.getArticle(page);
    },
    articles_grpc: async (_, { page }) => {
      return await articleGRPC.get(page);
    }
  }
});

module.exports = resolvers;
