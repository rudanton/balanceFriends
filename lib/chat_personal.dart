import 'package:balance_friends/models/profile.dart';
import 'package:balance_friends/widget/chat_widget.dart';
import 'package:balance_friends/widget/text_feild.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatPersonalArgument{
  final Profile person;
  final Profile me;
  ChatPersonalArgument({required this.me, required this.person});
}

class ChatPersonal extends StatefulWidget{
  const ChatPersonal({Key? key}) : super(key:key);

  @override
  _ChatPersonal createState() => _ChatPersonal();
}
class _ChatPersonal extends State<ChatPersonal>{
  late Profile person;
  late Profile me;
  List<Widget> chatLog = [];
  TextEditingController chatController = TextEditingController();
  @override
  void initState() {
    // TODO: 서버에서 그간 기록 받아옴.

    super.initState();
  }
  void didChangeDependencies(){
    final args = ModalRoute.of(context)!.settings.arguments as ChatPersonalArgument;
    person = args.person;
    me = args.me;
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('${person.name} 님과의 대화.'),
      ),
      body: Column(
        children: [SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children:chatLog,
            ),
          ),
        ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Container(
              height: 20,
              child: CustomTextField(
                  hasBorder: false,
                  hinText: '채팅을 시작하세요',
                  maxLines: 1,
                  textEditingController: chatController,
                  onSubmitted: OnSubmit),
            ),
          ),
          Container(
            child: ElevatedButton(
                onPressed: () {
                  OnSubmit(chatController.text);
                },
                child: Text('전송')),
          ),
        ]
      ),
    );
  }
  void OnSubmit(String chat) {
    chatLog.add(ChatLog(chat: chat, profile: me,));
    chatController.text = "";
    setState(() {});
  }
}