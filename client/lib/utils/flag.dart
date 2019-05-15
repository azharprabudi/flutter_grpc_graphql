const GRPC_SCREEN = "GRPC_SCREEN";
const GRAPHQL_SCREEN = "GRAPHQL_SCREEN";

const _features = {
  GRPC_SCREEN: false,
  GRAPHQL_SCREEN: true,
};

bool isFeatureAvailable(String key) =>
    _features.containsKey(key) && _features[key];
