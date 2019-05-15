import 'package:client/api/proto/chat.pbgrpc.dart';
import 'package:grpc/grpc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';

class ChatGrpcBloc {
  ChatServiceClient _csc;
  ResponseStream<Chat> _cc;

  BehaviorSubject<String> _name$;
  BehaviorSubject<String> _message$;
  BehaviorSubject<List<Chat>> _messages$;
  BehaviorSubject<int> _click$;

  Function get onChangeName => _name$.sink.add;
  Function get onChangeMessage => _message$.sink.add;
  Function get onSubmit => _click$.sink.add;

  Stream<List<Chat>> get messages => _messages$.stream;

  ChatGrpcBloc() {
    ClientChannel _ch = ClientChannel(
      "192.168.0.103",
      port: 6969,
      options: ChannelOptions(
        credentials: ChannelCredentials.insecure(),
      ),
    );

    _csc = ChatServiceClient(_ch);

    Chat _dummyChat = Chat();
    _dummyChat.id = "kondel";
    _dummyChat.name = "konde";
    _dummyChat.message = "kondel";

    _csc.send(Observable.just(_dummyChat)).listen(_addListenerIncomingChat);

    _name$ = BehaviorSubject<String>();
    _message$ = BehaviorSubject<String>();
    _messages$ = BehaviorSubject<List<Chat>>();
    _click$ = BehaviorSubject<int>();

    _addListenerSubmitChat();
  }

  void _addListenerSubmitChat() {
    _click$
        .concatMap(
      (_) => Observable.just(
            (() {
              Chat chat = Chat();
              chat.id = DateTime.now().millisecondsSinceEpoch.toString();
              chat.name = _name$.value;
              chat.message = _message$.value;

              _csc.send(Observable.just(chat)).listen(_addListenerIncomingChat);
            }()),
          ),
    )
        .listen(
      (data) {},
      onError: (err) {
        print("Error from app: $err");
      },
    );
  }

  void _addListenerIncomingChat(Chat chat) {
    if (chat.id != "" && chat.message != "" && chat.name != "") {
      if (_messages$.value == null) {
        _messages$.sink.add([chat]);
      }

      _messages$.sink.add(_messages$.value..add(chat));
    }
  }

  dispose() {
    _cc.cancel();
    _name$.close();
    _message$.close();
    _messages$.close();
  }
}
