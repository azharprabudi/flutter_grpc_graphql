const configs = {
  FGG_NODE_ENV: process.env.FGG_NODE_ENV || "development",
  FGG_REDIS_HOST: process.env.FGG_REDIS_HOST || "localhost",
  FGG_REDIS_PORT: process.env.FGG_REDIS_PORT || 6379,
  FGG_NEWS_API_KEY: process.env.FGG_NEWS_API_KEY || "rahasia",
  FGG_GRAPHQL_PORT: process.env.FGG_GRAPHQL_PORT || 9669,
  FGG_GRPC_ADDRESS: process.env.FGG_GRPC_ADDRESS || "localhost:6969",
  FGG_POST_BASEURL:
    process.env.FGG_POST_BASEURL || "http://jsonplaceholder.typicode.com"
};

module.exports = configs;
