import 'package:client/api/proto/article.pbgrpc.dart';
import 'package:client/widgets/article/base_item.dart';
import 'package:client/widgets/article/item_load.dart';
import 'package:client/widgets/shared/bloc_provider.dart';
import 'package:client/pages/article_graphql_bloc/bloc/article.dart' as Bloc;
import 'package:flutter/material.dart';

class ArticleGraphQLBloc extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ArticleGraphQLBlocState();
}

class _ArticleGraphQLBlocState extends State<ArticleGraphQLBloc> {
  ScrollController _lsController;

  _ArticleGraphQLBlocState() {
    _lsController = ScrollController();
    _lsController.addListener(_onScroll);
  }

  @override
  void initState() {
    super.initState();
    BlocProvider.of<Bloc.ArticleGraphQLBloc>(context).fetchArticles(1);
  }

  @override
  void dispose() {
    super.dispose();
    BlocProvider.of<Bloc.ArticleGraphQLBloc>(context).dispose();
  }

  bool _isPositionEnd() {
    double range =
        _lsController.offset - _lsController.position.maxScrollExtent;
    double distanceToScrollEnd = -250;
    return range >= distanceToScrollEnd;
  }

  void _onScroll() {
    if (_isPositionEnd()) {
      BlocProvider.of<Bloc.ArticleGraphQLBloc>(context).fetchArticles(1);
    }
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
        stream: BlocProvider.of<Bloc.ArticleGraphQLBloc>(context).articles,
        builder: (BuildContext ctx, AsyncSnapshot<List<Article>> snapshot) {
          if (snapshot.data == null) {
            return ListView.builder(
              itemCount: 6,
              itemBuilder: _itemLoadBuilder,
            );
          }

          return ListView.builder(
            controller: _lsController,
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext _, int index) => _itemBuilder(
                  title: snapshot.data[index].title,
                  image: snapshot.data[index].urlToImage,
                ),
          );
        },
      ),
    );
  }
}
