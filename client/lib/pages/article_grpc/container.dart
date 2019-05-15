import 'package:client/pages/article_grpc/bloc/article.dart';
import 'package:client/pages/article_grpc/screen.dart';
import 'package:client/widgets/shared/bloc_provider.dart';
import 'package:flutter/widgets.dart';

class ContainerArticleGrpc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ArticleGrpcBloc>(
      bloc: ArticleGrpcBloc(),
      child: ArticleGrpc(),
    );
  }
}
