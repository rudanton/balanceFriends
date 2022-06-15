import 'package:balance_friends/models/profile.dart';
import 'package:balance_friends/widget/text_feild.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatPublicArgument {
  final Profile profile;

  ChatPublicArgument({required this.profile});
}

class ChatPublic extends StatefulWidget {
  const ChatPublic({Key? key}) : super(key: key);

  @override
  _ChatPublic createState() => _ChatPublic();
}

class _ChatPublic extends State<ChatPublic> {
  late TextEditingController chatController;
  List<Widget> chatLog = [];
  late Profile profile;

  List<Profile> prList = [];
  late final args;

  @override
  void initState() {
    chatController = TextEditingController();

    super.initState();
  }

  void didChangeDependencies() {
    /// 프로필 리스트 불러오기.
    args = ModalRoute.of(context)!.settings.arguments as ChatPublicArgument;

    profile = args.profile;
    prList.add(profile);
    super.didChangeDependencies();
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
                    padding: EdgeInsets.only(left: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: chatLog,
                    ),
                  )),
                  flex: 4,
                  fit: FlexFit.tight,
                ),
                Flexible(
                  child: SingleChildScrollView(
                      child: Column(
                    children: prList.map((e) => buildProfile(e)).toList(),
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
        ],
      ),
    );
  }

  void OnSubmit(String text) {
    chatLog.add(buildChatLog(profile, text));
    chatController.text = "";
    setState(() {});
  }
  Widget buildChatLog(Profile pr, String chat){
    return Padding(
      padding: EdgeInsets.all(5),
      child: Row(
        children: [
          Image.network(pr.imgUrl, width: 30, height: 30,),
          Expanded(child: Text('${pr.name} : $chat'))
        ],
      ),
    );
  }
  Widget buildProfile(Profile pr) {
    return Row(
      children: [
        Image.network(
          profile.imgUrl,
          width: 20,
          height: 20,
        ),
        Text(profile.name),
      ],
    );
  }
}
