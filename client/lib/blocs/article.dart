import 'package:client/api/proto/article.pbgrpc.dart';
import 'package:grpc/grpc.dart';
import 'package:grpc/service_api.dart';
import 'package:rxdart/rxdart.dart';

class ArticleBloc {
  int _page;
  ArticleServiceClient _asc;
  BehaviorSubject<int> _obs$;
  BehaviorSubject<Articles> _articles$;

  get fetchArticles => _obs$.sink.add;
  Stream<Articles> get articles => _articles$.stream;

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

    _obs$ = BehaviorSubject<int>();
    _articles$ = BehaviorSubject<Articles>();

    _obs$.concatMap((_) => _getArticles(_page)).listen(
      (Articles resp) {
        _page += 1;
        _articles$.sink.add(resp);
      },
      onError: (err) => _articles$.sink.addError(err),
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
