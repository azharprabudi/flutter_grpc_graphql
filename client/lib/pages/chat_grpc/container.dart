import 'package:client/pages/chat_grpc/bloc/chat.dart';
import 'package:client/pages/chat_grpc/screen.dart';
import 'package:client/widgets/shared/bloc_provider.dart';
import 'package:flutter/material.dart';

class ContainerChatGrpc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ChatGrpcBloc>(
      bloc: ChatGrpcBloc(),
      child: ChatGrpc(),
    );
  }
}
