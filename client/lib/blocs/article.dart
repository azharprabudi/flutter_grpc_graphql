import 'package:client/api/proto/article.pbgrpc.dart';
import 'package:grpc/grpc.dart';
import 'package:grpc/service_api.dart';
import 'package:rxdart/rxdart.dart';

class ArticleBloc {
  int _page;
  ArticleServiceClient _asc;
  BehaviorSubject<int> _obs$;
  BehaviorSubject<List<Article>> _articles$;

  get fetchArticles => _obs$.sink.add;
  Stream<List<Article>> get articles => _articles$.stream;

  ArticleBloc() {
    ClientChannel _ch = ClientChannel(
      "192.168.0.103",
      port: 6969,
      options: ChannelOptions(
        credentials: ChannelCredentials.insecure(),
      ),
    );

    _asc = ArticleServiceClient(
      _ch,
    );

    _page = 1;
    _obs$ = BehaviorSubject<int>();
    _articles$ = BehaviorSubject<List<Article>>();

    _obs$
        .debounce(Duration(milliseconds: 250))
        .exhaustMap((_) => _getArticles(_page))
        .map((resp) => resp.articles)
        .listen(
      (List<Article> resp) {
        _page += 1;

        if (_articles$.value == null) {
          _articles$.sink.add(resp);
          return;
        }

        _articles$.sink.add(_articles$.value..addAll(resp));
      },
      onError: (err) {
        print("Error from app: $err");
        _articles$.sink.addError(err);
      },
      cancelOnError: true,
    );
  }

  Observable<Articles> _getArticles(int page) {
    return Observable<Articles>.fromFuture((() {
      ArticlePagination _ap = ArticlePagination();
      _ap.page = page;

      return _asc.get(_ap);
    })());
  }

  dispose() {
    _obs$.close();
    _articles$.close();
  }
}
