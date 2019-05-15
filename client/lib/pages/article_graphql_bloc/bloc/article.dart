import 'package:client/api/proto/article.pbgrpc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';

class ArticleGraphQLBloc {
  GraphQLClient _gqlClient;
  BehaviorSubject<int> _scroll$;
  BehaviorSubject<List<Article>> _articles$;

  get fetchArticles => _scroll$.sink.add;
  Stream<List<Article>> get articles => _articles$.stream;

  String _query;
  int _page;

  ArticleGraphQLBloc() {
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
    _page = 1;

    _scroll$ = BehaviorSubject<int>();
    _articles$ = BehaviorSubject<List<Article>>();
    _gqlClient = GraphQLClient(
      link: (HttpLink(uri: 'http://192.168.0.103:9669/graphql') as Link),
      cache: InMemoryCache(),
    );

    _addListenerFetchArticles();
  }

  void _addListenerFetchArticles() {
    _scroll$
        .debounce(Duration(milliseconds: 250))
        .exhaustMap(
          (_) => Observable.fromFuture(
                (() async {
                  var resp = await _gqlClient.query(
                    QueryOptions(
                      document: _query,
                      variables: {
                        "page": _page,
                      },
                    ),
                  );

                  return resp.data;
                })(),
              ),
        )
        .map((resp) {
      List<dynamic> articles = resp['articles']['articles'] as List<dynamic>;
      return articles.map((article) {
        Article _ar = Article();
        _ar.title = article['title'];
        _ar.urlToImage = article['urlToImage'];

        return _ar;
      }).toList();
    }).listen(
      (data) {
        _page += 1;

        if (_articles$.value == null) {
          _articles$.sink.add(data);
        }

        _articles$.sink.add(_articles$.value..addAll(data));
      },
      onError: (err) {
        print("Error from app: $err");
        _articles$.sink.addError(err);
      },
      cancelOnError: true,
    );
  }

  void dispose() {
    _scroll$.close();
    _articles$.close();
  }
}
