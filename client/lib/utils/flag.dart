const GRPC_SCREEN = "GRPC_SCREEN";
const GRAPHQL_SCREEN = "GRAPHQL_SCREEN";
const GRAPHQL_BLOC_SCREEN = "GRAPHQL_BLOC_SCREEN";

const _features = {
  GRPC_SCREEN: false,
  GRAPHQL_SCREEN: true,
  GRAPHQL_BLOC_SCREEN: false,
};

bool isFeatureAvailable(String key) =>
    _features.containsKey(key) && _features[key];
