import 'package:client/pages/article_graphql_bloc/bloc/article.dart';
import 'package:client/pages/article_graphql_bloc/screen.dart' as Screen;
import 'package:client/widgets/shared/bloc_provider.dart';
import 'package:flutter/widgets.dart';

class ContainerGraphQLBloc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ArticleGraphQLBloc>(
      bloc: ArticleGraphQLBloc(),
      child: Screen.ArticleGraphQLBloc(),
    );
  }
}
