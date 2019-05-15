import 'package:client/pages/article_graphql/screen.dart';
import 'package:client/widgets/shared/graphql_client_provider.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class ContainerArticleGraphQL extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GraphQLClientProvider(
        client: ValueNotifier<GraphQLClient>(
          GraphQLClient(
            link: (HttpLink(
              uri: 'http://192.168.0.103:9669/graphiql',
            ) as Link),
            cache: InMemoryCache(),
          ),
        ),
        child: ArticleGraphQL(),
      ),
    );
  }
}
