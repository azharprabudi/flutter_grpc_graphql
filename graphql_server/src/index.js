const { ApolloServer, gql } = require("apollo-server");

const server = new ApolloServer({});

server.listen().then(() => console.log("Your graphql server already run"));
