const { ApolloServer } = require("apollo-server");
const { makeExecutableSchema } = require("graphql-tools");
const { RedisCache } = require("apollo-server-cache-redis");

// typedef
const QueryType = require("./types/query");
const ArticleType = require("./types/article");

// resolver
const QueryResolver = require("./resolvers/query");

// datasource
const ArticleAPI = require("./datasources/article");

// utils
const configs = require("./configs/configs");

const server = new ApolloServer({
  schema: makeExecutableSchema({
    typeDefs: [QueryType, ArticleType],
    resolvers: QueryResolver
  }),
  cache: new RedisCache({
    host: configs.FGG_REDIS_HOST,
    port: configs.FGG_REDIS_PORT
  }),
  playground: configs.FGG_NODE_ENV != "production",
  dataSources: () => ({
    articleAPI: new ArticleAPI()
  })
});

server
  .listen({
    port: configs.FGG_GRAPHQL_PORT
  })
  .then(({ url }) => console.log(`Your graphql server already run at ${url}`));
