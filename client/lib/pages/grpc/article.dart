import 'package:client/api/proto/article.pbgrpc.dart';
import 'package:client/blocs/article.dart';
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
            return Container(
              width: 200,
              height: 200,
              child: Shimmer.fromColors(
                baseColor: Colors.grey[300],
                highlightColor: Colors.grey[200],
                direction: ShimmerDirection.ltr,
                period: Duration(seconds: 1),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                ),
              ),
            );
          }

          return ListView.builder(
            itemCount: snapshot.data.articles.length,
            itemBuilder: (BuildContext ctx, int index) =>
                Text(snapshot.data.articles[index].author),
          );
        },
      ),
    );
  }
}
