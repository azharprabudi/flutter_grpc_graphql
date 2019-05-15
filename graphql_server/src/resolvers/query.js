const resolvers = {
  Query: {
    articles: async (_, { page }, { dataSources: { articleAPI } }) => {
      return await articleAPI.getArticle(page);
    }
  }
};

module.exports = resolvers;
