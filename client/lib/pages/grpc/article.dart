import 'package:client/api/proto/article.pbgrpc.dart';
import 'package:client/blocs/article.dart';
import 'package:client/widgets/article/base_item.dart';
import 'package:client/widgets/article/item_load.dart';
import 'package:client/widgets/shared/bloc_provider.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Article extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ArticleState();
}

class _ArticleState extends State<Article> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ArticleBloc>(context).fetchArticles(1);
  }

  @override
  void dispose() {
    super.dispose();
    BlocProvider.of<ArticleBloc>(context).dispose();
  }

  Widget _itemLoadBuilder(BuildContext _, int __) => ItemLoad();

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Article",
        ),
      ),
      body: StreamBuilder(
        stream: BlocProvider.of<ArticleBloc>(context).articles,
        builder: (BuildContext ctx, AsyncSnapshot<Articles> snapshot) {
          if (snapshot.data == null) {
            return ListView.builder(
              itemCount: 6,
              itemBuilder: _itemLoadBuilder,
            );
          }

          return ListView.builder(
            itemCount: snapshot.data.articles.length,
            itemBuilder: (BuildContext _, int index) => _itemBuilder(
                  title: snapshot.data.articles[index].title,
                  image: snapshot.data.articles[index].urlToImage,
                ),
          );
        },
      ),
    );
  }
}
