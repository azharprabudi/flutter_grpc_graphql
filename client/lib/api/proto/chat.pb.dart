///
//  Generated code. Do not modify.
//  source: chat.proto
///
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name

import 'dart:core' as $core show bool, Deprecated, double, int, List, Map, override, String;

import 'package:protobuf/protobuf.dart' as $pb;

class Chat extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Chat', package: const $pb.PackageName('proto'))
    ..aOS(1, 'id')
    ..aOS(2, 'name')
    ..aOS(3, 'message')
    ..hasRequiredFields = false
  ;

  Chat() : super();
  Chat.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  Chat.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  Chat clone() => Chat()..mergeFromMessage(this);
  Chat copyWith(void Function(Chat) updates) => super.copyWith((message) => updates(message as Chat));
  $pb.BuilderInfo get info_ => _i;
  static Chat create() => Chat();
  Chat createEmptyInstance() => create();
  static $pb.PbList<Chat> createRepeated() => $pb.PbList<Chat>();
  static Chat getDefault() => _defaultInstance ??= create()..freeze();
  static Chat _defaultInstance;

  $core.String get id => $_getS(0, '');
  set id($core.String v) { $_setString(0, v); }
  $core.bool hasId() => $_has(0);
  void clearId() => clearField(1);

  $core.String get name => $_getS(1, '');
  set name($core.String v) { $_setString(1, v); }
  $core.bool hasName() => $_has(1);
  void clearName() => clearField(2);

  $core.String get message => $_getS(2, '');
  set message($core.String v) { $_setString(2, v); }
  $core.bool hasMessage() => $_has(2);
  void clearMessage() => clearField(3);
}

