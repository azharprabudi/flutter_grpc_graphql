const GRPC_SCREEN = "GRPC_SCREEN";
const GRAPHQL_SCREEN = "GRAPHQL_SCREEN";

const _features = {
  [GRPC_SCREEN]: true,
  [GRAPHQL_SCREEN]: false,
};

bool isFeatureAvailable(String key) => _features.containsKey(key);
