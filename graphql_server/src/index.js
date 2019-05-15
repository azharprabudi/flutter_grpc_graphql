const { ApolloServer, gql } = require("apollo-server");
const { makeExecutableSchema } = require("graphql-tools");

// typedef
const QueryType = require("./types/query");
const ArticleType = require("./types/article");

// resolver
const QueryResolver = require("./resolvers/query");

const server = new ApolloServer({
  schema: makeExecutableSchema({
    typeDefs: [QueryType, ArticleType],
    resolvers: QueryResolver
  }),
  playground: process.env.NODE_ENV != "production"
});

server
  .listen({
    port: process.env.PORT || "9669"
  })
  .then(({ url }) => console.log(`Your graphql server already run at ${url}`));
