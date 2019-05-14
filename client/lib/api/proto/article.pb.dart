///
//  Generated code. Do not modify.
//  source: article.proto
///
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name

import 'dart:core' as $core show bool, Deprecated, double, int, List, Map, override, String;

import 'package:protobuf/protobuf.dart' as $pb;

class Articles extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Articles', package: const $pb.PackageName('proto'))
    ..aOS(1, 'status')
    ..a<$core.int>(2, 'totalResults', $pb.PbFieldType.O3)
    ..pc<Article>(3, 'articles', $pb.PbFieldType.PM,Article.create)
    ..hasRequiredFields = false
  ;

  Articles() : super();
  Articles.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  Articles.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  Articles clone() => Articles()..mergeFromMessage(this);
  Articles copyWith(void Function(Articles) updates) => super.copyWith((message) => updates(message as Articles));
  $pb.BuilderInfo get info_ => _i;
  static Articles create() => Articles();
  Articles createEmptyInstance() => create();
  static $pb.PbList<Articles> createRepeated() => $pb.PbList<Articles>();
  static Articles getDefault() => _defaultInstance ??= create()..freeze();
  static Articles _defaultInstance;

  $core.String get status => $_getS(0, '');
  set status($core.String v) { $_setString(0, v); }
  $core.bool hasStatus() => $_has(0);
  void clearStatus() => clearField(1);

  $core.int get totalResults => $_get(1, 0);
  set totalResults($core.int v) { $_setSignedInt32(1, v); }
  $core.bool hasTotalResults() => $_has(1);
  void clearTotalResults() => clearField(2);

  $core.List<Article> get articles => $_getList(2);
}

class Article extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Article', package: const $pb.PackageName('proto'))
    ..a<ArticleSource>(1, 'source', $pb.PbFieldType.OM, ArticleSource.getDefault, ArticleSource.create)
    ..aOS(2, 'author')
    ..aOS(3, 'title')
    ..aOS(4, 'description')
    ..aOS(5, 'url')
    ..aOS(6, 'urlToImage')
    ..aOS(7, 'publishedAt')
    ..aOS(8, 'content')
    ..hasRequiredFields = false
  ;

  Article() : super();
  Article.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  Article.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  Article clone() => Article()..mergeFromMessage(this);
  Article copyWith(void Function(Article) updates) => super.copyWith((message) => updates(message as Article));
  $pb.BuilderInfo get info_ => _i;
  static Article create() => Article();
  Article createEmptyInstance() => create();
  static $pb.PbList<Article> createRepeated() => $pb.PbList<Article>();
  static Article getDefault() => _defaultInstance ??= create()..freeze();
  static Article _defaultInstance;

  ArticleSource get source => $_getN(0);
  set source(ArticleSource v) { setField(1, v); }
  $core.bool hasSource() => $_has(0);
  void clearSource() => clearField(1);

  $core.String get author => $_getS(1, '');
  set author($core.String v) { $_setString(1, v); }
  $core.bool hasAuthor() => $_has(1);
  void clearAuthor() => clearField(2);

  $core.String get title => $_getS(2, '');
  set title($core.String v) { $_setString(2, v); }
  $core.bool hasTitle() => $_has(2);
  void clearTitle() => clearField(3);

  $core.String get description => $_getS(3, '');
  set description($core.String v) { $_setString(3, v); }
  $core.bool hasDescription() => $_has(3);
  void clearDescription() => clearField(4);

  $core.String get url => $_getS(4, '');
  set url($core.String v) { $_setString(4, v); }
  $core.bool hasUrl() => $_has(4);
  void clearUrl() => clearField(5);

  $core.String get urlToImage => $_getS(5, '');
  set urlToImage($core.String v) { $_setString(5, v); }
  $core.bool hasUrlToImage() => $_has(5);
  void clearUrlToImage() => clearField(6);

  $core.String get publishedAt => $_getS(6, '');
  set publishedAt($core.String v) { $_setString(6, v); }
  $core.bool hasPublishedAt() => $_has(6);
  void clearPublishedAt() => clearField(7);

  $core.String get content => $_getS(7, '');
  set content($core.String v) { $_setString(7, v); }
  $core.bool hasContent() => $_has(7);
  void clearContent() => clearField(8);
}

class ArticleSource extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ArticleSource', package: const $pb.PackageName('proto'))
    ..a<$core.int>(1, 'id', $pb.PbFieldType.O3)
    ..aOS(2, 'name')
    ..hasRequiredFields = false
  ;

  ArticleSource() : super();
  ArticleSource.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  ArticleSource.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  ArticleSource clone() => ArticleSource()..mergeFromMessage(this);
  ArticleSource copyWith(void Function(ArticleSource) updates) => super.copyWith((message) => updates(message as ArticleSource));
  $pb.BuilderInfo get info_ => _i;
  static ArticleSource create() => ArticleSource();
  ArticleSource createEmptyInstance() => create();
  static $pb.PbList<ArticleSource> createRepeated() => $pb.PbList<ArticleSource>();
  static ArticleSource getDefault() => _defaultInstance ??= create()..freeze();
  static ArticleSource _defaultInstance;

  $core.int get id => $_get(0, 0);
  set id($core.int v) { $_setSignedInt32(0, v); }
  $core.bool hasId() => $_has(0);
  void clearId() => clearField(1);

  $core.String get name => $_getS(1, '');
  set name($core.String v) { $_setString(1, v); }
  $core.bool hasName() => $_has(1);
  void clearName() => clearField(2);
}

class ArticlePagination extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ArticlePagination', package: const $pb.PackageName('proto'))
    ..a<$core.int>(1, 'page', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  ArticlePagination() : super();
  ArticlePagination.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  ArticlePagination.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  ArticlePagination clone() => ArticlePagination()..mergeFromMessage(this);
  ArticlePagination copyWith(void Function(ArticlePagination) updates) => super.copyWith((message) => updates(message as ArticlePagination));
  $pb.BuilderInfo get info_ => _i;
  static ArticlePagination create() => ArticlePagination();
  ArticlePagination createEmptyInstance() => create();
  static $pb.PbList<ArticlePagination> createRepeated() => $pb.PbList<ArticlePagination>();
  static ArticlePagination getDefault() => _defaultInstance ??= create()..freeze();
  static ArticlePagination _defaultInstance;

  $core.int get page => $_get(0, 0);
  set page($core.int v) { $_setSignedInt32(0, v); }
  $core.bool hasPage() => $_has(0);
  void clearPage() => clearField(1);
}

