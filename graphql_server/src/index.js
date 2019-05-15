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

const server = new ApolloServer({
  schema: makeExecutableSchema({
    typeDefs: [QueryType, ArticleType],
    resolvers: QueryResolver
  }),
  cache: new RedisCache({
    host: "127.0.0.1",
    port: 6379
  }),
  playground: process.env.NODE_ENV != "production",
  dataSources: () => ({
    articleAPI: new ArticleAPI()
  })
});

server
  .listen({
    port: process.env.PORT || "9669"
  })
  .then(({ url }) => console.log(`Your graphql server already run at ${url}`));
