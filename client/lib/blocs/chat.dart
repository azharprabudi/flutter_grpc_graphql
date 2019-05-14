import 'package:client/api/proto/chat.pbgrpc.dart';
import 'package:grpc/grpc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';

class ChatBloc {
  ClientCall<Chat, Chat> _cc;
  ChatServiceClient _csc;

  BehaviorSubject<String> _name$;
  BehaviorSubject<String> _message$;
  BehaviorSubject<List<Chat>> _messages$;
  BehaviorSubject<int> _click$;

  Function get onChangeName => _name$.sink.add;
  Function get onChangeMessage => _message$.sink.add;
  Function get onSubmit => _click$.sink.add;

  Stream<List<Chat>> get messages => _messages$.stream;

  ChatBloc() {
    ClientChannel _ch = ClientChannel(
      "192.168.0.103",
      port: 6969,
      options: ChannelOptions(
        credentials: ChannelCredentials.insecure(),
      ),
    );

    _csc = ChatServiceClient(_ch);
    _cc = _csc.$createCall<Chat, Chat>(null, null);

    _addListenerSubmitChat();
    _addListenerIncomingChat();
  }

  void _addListenerSubmitChat() {
    _click$.concatMap(
      (_) => Observable.fromFuture(
            (() {
              Chat chat = Chat();
              chat.id = DateTime.now().millisecondsSinceEpoch.toString();
              chat.name = _name$.value;
              chat.message = _message$.value;

              _csc.send(Observable.just(chat));
            }()),
          ),
    );
  }

  void _addListenerIncomingChat() {
    _cc.response.listen((Chat chat) {
      if (_messages$.value == null) {
        _messages$.sink.add([chat]);
      }

      _messages$.sink.add(_messages$.value..add(chat));
    });
  }

  dispose() {
    _cc.cancel();
    _name$.close();
    _message$.close();
    _messages$.close();
  }
}
