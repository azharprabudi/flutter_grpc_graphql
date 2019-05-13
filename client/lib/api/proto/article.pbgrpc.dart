///
//  Generated code. Do not modify.
//  source: article.proto
///
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'package:grpc/service_api.dart' as $grpc;

import 'dart:core' as $core show int, String, List;

import 'article.pb.dart';
import 'general.pb.dart' as $0;
export 'article.pb.dart';

class ArticleServiceClient extends $grpc.Client {
  static final _$get = $grpc.ClientMethod<ArticlePagination, Articles>(
      '/proto.ArticleService/Get',
      (ArticlePagination value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => Articles.fromBuffer(value));
  static final _$bookmark = $grpc.ClientMethod<Article, $0.Empty>(
      '/proto.ArticleService/Bookmark',
      (Article value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Empty.fromBuffer(value));

  ArticleServiceClient($grpc.ClientChannel channel, {$grpc.CallOptions options})
      : super(channel, options: options);

  $grpc.ResponseFuture<Articles> get(ArticlePagination request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$get, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.Empty> bookmark(Article request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$bookmark, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }
}

abstract class ArticleServiceBase extends $grpc.Service {
  $core.String get $name => 'proto.ArticleService';

  ArticleServiceBase() {
    $addMethod($grpc.ServiceMethod<ArticlePagination, Articles>(
        'Get',
        get_Pre,
        false,
        false,
        ($core.List<$core.int> value) => ArticlePagination.fromBuffer(value),
        (Articles value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<Article, $0.Empty>(
        'Bookmark',
        bookmark_Pre,
        false,
        false,
        ($core.List<$core.int> value) => Article.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
  }

  $async.Future<Articles> get_Pre(
      $grpc.ServiceCall call, $async.Future request) async {
    return get(call, await request);
  }

  $async.Future<$0.Empty> bookmark_Pre(
      $grpc.ServiceCall call, $async.Future request) async {
    return bookmark(call, await request);
  }

  $async.Future<Articles> get(
      $grpc.ServiceCall call, ArticlePagination request);
  $async.Future<$0.Empty> bookmark($grpc.ServiceCall call, Article request);
}
