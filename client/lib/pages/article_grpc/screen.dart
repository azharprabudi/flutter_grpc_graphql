import 'package:client/api/proto/article.pbgrpc.dart';
import 'package:client/pages/article_grpc/bloc/article.dart';
import 'package:client/pages/chat_grpc/bloc/chat.dart';
import 'package:client/pages/chat_grpc/container.dart';
import 'package:client/pages/chat_grpc/screen.dart';
import 'package:client/widgets/article/base_item.dart';
import 'package:client/widgets/article/item_load.dart';
import 'package:client/widgets/shared/bloc_provider.dart';
import 'package:flutter/material.dart';

class ArticleGrpc extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ArticleGrpcState();
}

class _ArticleGrpcState extends State<ArticleGrpc> {
  ScrollController _lsController;

  _ArticleGrpcState() {
    _lsController = ScrollController();
    _lsController.addListener(_onScroll);
  }

  @override
  void initState() {
    super.initState();
    BlocProvider.of<ArticleGrpcBloc>(context).fetchArticles(1);
  }

  @override
  void dispose() {
    super.dispose();
    BlocProvider.of<ArticleGrpcBloc>(context).dispose();
  }

  bool _isPositionEnd() {
    double range =
        _lsController.offset - _lsController.position.maxScrollExtent;
    double distanceToScrollEnd = -250;
    return range >= distanceToScrollEnd;
  }

  void _onScroll() {
    if (_isPositionEnd()) {
      BlocProvider.of<ArticleGrpcBloc>(context).fetchArticles(1);
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

  void _navigateToChat() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => ContainerChatGrpc(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Article",
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.message),
            onPressed: _navigateToChat,
          ),
        ],
      ),
      body: StreamBuilder(
        stream: BlocProvider.of<ArticleGrpcBloc>(context).articles,
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
