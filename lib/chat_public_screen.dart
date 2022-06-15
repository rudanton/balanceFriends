import 'package:balance_friends/widget/text_feild.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatPublic extends StatefulWidget {
  @override
  _ChatPublic createState() => _ChatPublic();
}

class _ChatPublic extends State<ChatPublic> {
  late TextEditingController chatController;
  List<String> chatLog = [""];

  @override
  void initState() {
    chatController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("공개 채팅방"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Flexible(
                  child: SingleChildScrollView(
                      child: Padding(
                    padding: EdgeInsets.only(left: 25),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:
                      chatLog.map((e) => Text(e)).toList(),
                    ),
                  )),
                  flex: 4,
                  fit: FlexFit.tight,
                ),
                Flexible(
                  child: SingleChildScrollView(
                      child: Column(
                    children: [
                      Text('사용자.'),
                    ],
                  )),
                  flex: 1,
                ),
              ],
            ),
          ),
          Container(
            height: 1,
            decoration: BoxDecoration(border: Border.all()),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child:  Container(
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
        ],
      ),
    );
  }

  void OnSubmit(String text) {
    chatLog.add(text);
    chatController.text = "";
    setState(() {});
  }
}
