import 'package:client/api/proto/chat.pbgrpc.dart';
import 'package:client/pages/chat_grpc/bloc/chat.dart';
import 'package:client/widgets/shared/bloc_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ChatGrpc extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ChatGrpcState();
}

class _ChatGrpcState extends State<ChatGrpc> {
  void _onChangedName(String name) {
    BlocProvider.of<ChatGrpcBloc>(context).onChangeName(name);
  }

  void _onChangedMessage(String message) {
    BlocProvider.of<ChatGrpcBloc>(context).onChangeMessage(message);
  }

  Widget _itemBuilder({@required String name, @required String message}) {
    return Text('$name    : $message');
  }

  void _onPressed() {
    BlocProvider.of<ChatGrpcBloc>(context).onSubmit(1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat"),
      ),
      body: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(vertical: 8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Your name",
                ),
                onChanged: _onChangedName,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Your message",
                ),
                onChanged: _onChangedMessage,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8.0),
              child: RaisedButton(
                onPressed: _onPressed,
                child: Text('Submit'),
              ),
            ),
            StreamBuilder<List<Chat>>(
              stream: BlocProvider.of<ChatGrpcBloc>(context).messages,
              builder:
                  (BuildContext context, AsyncSnapshot<List<Chat>> snapshot) {
                if (!snapshot.hasData) {
                  return Container();
                }

                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) =>
                      _itemBuilder(
                        name: snapshot.data[index].name,
                        message: snapshot.data[index].message,
                      ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
