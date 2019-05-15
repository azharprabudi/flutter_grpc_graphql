import 'package:client/widgets/article/base_item.dart';
import 'package:client/widgets/article/item_load.dart';
import 'package:client/widgets/shared/graphql_client_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class ArticleGraphQL extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ArticleGraphQLState();
}

class _ArticleGraphQLState extends State<ArticleGraphQL> {
  String _query;

  _ArticleGraphQLState() {
    _query = r'''
      query articles($page: Int) {
        articles(page: $page) {
          status,
          totalResults,
          articles {
            title,
            urlToImage
          } 
        }
      }
    ''';
  }

  Widget _itemBuilder({
    @required String title,
    @required String image,
  }) =>
      BaseItem(
        image: Image.network(
          image,
          fit: BoxFit.fill,
        ),
        content: Text(title),
        onPressed: () {},
      );

  Widget _itemLoadBuilder(BuildContext _, int __) => ItemLoad();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Article"),
      ),
      body: GraphQLProvider(
        client: GraphQLClientProvider.of(context).client,
        child: Query(
          options: QueryOptions(
            document: _query,
            variables: {
              "page": 1,
            },
          ),
          builder: (QueryResult result, {VoidCallback refetch}) {
            if (result.loading) {
              return ListView.builder(
                itemCount: 6,
                itemBuilder: _itemLoadBuilder,
              );
            }

            return ListView.builder(
              itemCount: result.data['articles']['articles'].length,
              itemBuilder: (BuildContext _, int index) => _itemBuilder(
                    title: result.data['articles']['articles'][index]['title'],
                    image: result.data['articles']['articles'][index]
                        ['urlToImage'],
                  ),
            );
          },
        ),
      ),
    );
  }
}
