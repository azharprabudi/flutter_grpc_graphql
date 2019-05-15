import 'package:client/blocs/grpc/chat.dart';
import 'package:client/widgets/shared/bloc_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:client/api/proto/chat.pbgrpc.dart' as ChatGrpc;

class Chat extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  void _onChangedName(String name) {
    BlocProvider.of<ChatBloc>(context).onChangeName(name);
  }

  void _onChangedMessage(String message) {
    BlocProvider.of<ChatBloc>(context).onChangeMessage(message);
  }

  Widget _itemBuilder({@required String name, @required String message}) {
    return Text('$name    : $message');
  }

  void _onPressed() {
    BlocProvider.of<ChatBloc>(context).onSubmit(1);
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
            StreamBuilder<List<ChatGrpc.Chat>>(
              stream: BlocProvider.of<ChatBloc>(context).messages,
              builder: (BuildContext context,
                  AsyncSnapshot<List<ChatGrpc.Chat>> snapshot) {
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
