import 'package:flutter/widgets.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class HttpLinkProvider<T> extends StatefulWidget {
  HttpLink link;
  Widget child;

  HttpLinkProvider({@required this.link, @required this.child, Key key})
      : super(key: key);

  static HttpLink of<T>(BuildContext context) {
    final type = _typeOf<T>();
    HttpLinkProvider<T> provider = context.ancestorWidgetOfExactType(type);

    return provider.link;
  }

  static Type _typeOf<T>() => T;

  @override
  State<StatefulWidget> createState() => _HttpLinkProvider();
}

class _HttpLinkProvider extends State<HttpLinkProvider> {
  @override
  Widget build(BuildContext context) => widget.child;
}
