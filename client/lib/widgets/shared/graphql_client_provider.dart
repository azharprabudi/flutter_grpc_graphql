import 'package:flutter/widgets.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQLClientProvider extends InheritedWidget {
  final ValueNotifier<GraphQLClient> client;
  final Widget child;

  GraphQLClientProvider({@required this.client, @required this.child, Key key})
      : super(key: key, child: child);

  static GraphQLClientProvider of(BuildContext context) =>
      context.inheritFromWidgetOfExactType(GraphQLClientProvider);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) =>
      child != oldWidget.child;
}
