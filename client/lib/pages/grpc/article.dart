import 'package:client/api/proto/article.pbgrpc.dart' as ArticleGRPC;
import 'package:client/blocs/article.dart';
import 'package:client/widgets/article/base_item.dart';
import 'package:client/widgets/article/item_load.dart';
import 'package:client/widgets/shared/bloc_provider.dart';
import 'package:flutter/material.dart';

class Article extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ArticleState();
}

class _ArticleState extends State<Article> {
  ScrollController _lsController;

  _ArticleState() {
    _lsController = ScrollController();
    _lsController.addListener(_onScroll);
  }

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

  bool _isPositionEnd() {
    double range =
        _lsController.offset - _lsController.position.maxScrollExtent;
    double distanceToScrollEnd = -250;
    return range >= distanceToScrollEnd;
  }

  void _onScroll() {
    if (_isPositionEnd()) {
      BlocProvider.of<ArticleBloc>(context).fetchArticles(1);
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
        stream: BlocProvider.of<ArticleBloc>(context).articles,
        builder: (BuildContext ctx,
            AsyncSnapshot<List<ArticleGRPC.Article>> snapshot) {
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
