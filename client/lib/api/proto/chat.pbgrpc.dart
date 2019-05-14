///
//  Generated code. Do not modify.
//  source: chat.proto
///
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'package:grpc/service_api.dart' as $grpc;

import 'dart:core' as $core show int, String, List;

import 'chat.pb.dart';
export 'chat.pb.dart';

class ChatServiceClient extends $grpc.Client {
  static final _$send = $grpc.ClientMethod<Chat, Chat>(
      '/proto.ChatService/Send',
      (Chat value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => Chat.fromBuffer(value));

  ChatServiceClient($grpc.ClientChannel channel, {$grpc.CallOptions options})
      : super(channel, options: options);

  $grpc.ResponseStream<Chat> send($async.Stream<Chat> request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$send, request, options: options);
    return $grpc.ResponseStream(call);
  }
}

abstract class ChatServiceBase extends $grpc.Service {
  $core.String get $name => 'proto.ChatService';

  ChatServiceBase() {
    $addMethod($grpc.ServiceMethod<Chat, Chat>(
        'Send',
        send,
        true,
        true,
        ($core.List<$core.int> value) => Chat.fromBuffer(value),
        (Chat value) => value.writeToBuffer()));
  }

  $async.Stream<Chat> send($grpc.ServiceCall call, $async.Stream<Chat> request);
}
