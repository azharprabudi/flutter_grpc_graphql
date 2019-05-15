const grpc = require("grpc");
const config = require("../configs/configs");

const client = () => {
  return new grpc.Client(configs.FGG_GRPC_ADDRESS);
};

module.exports = client;
