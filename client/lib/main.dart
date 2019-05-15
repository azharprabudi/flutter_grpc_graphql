import 'package:client/pages/article_graphql/container.dart';
import 'package:client/pages/article_grpc/container.dart';
import 'package:client/utils/flag.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  Widget get _build {
    if (isFeatureAvailable(GRPC_SCREEN)) {
      return ContainerArticleGrpc();
    }

    if (isFeatureAvailable(GRAPHQL_SCREEN)) {
      return ContainerArticleGraphQL();
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: _build,
    );
  }
}

void main() => runApp(App());
