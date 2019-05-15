const grpc = require("grpc");
const protoLoader = require("@grpc/proto-loader");
const path = require("path");
const configs = require("../../../configs/configs");

const packageDefinition = protoLoader.loadSync(
  path.resolve(__dirname, "../api/proto/article.proto")
);
const {
  proto: { ArticleService }
} = grpc.loadPackageDefinition(packageDefinition);

const client = new ArticleService(
  configs.FGG_GRPC_ADDRESS,
  grpc.credentials.createInsecure()
);

module.exports = client;
