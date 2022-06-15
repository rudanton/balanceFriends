import 'package:balance_friends/models/profile.dart';
import 'package:balance_friends/widget/buton_action_bottom_sheet.dart';
import 'package:balance_friends/widget/chat_widget.dart';
import 'package:balance_friends/widget/text_feild.dart';
import 'package:balance_friends/widget/touch_reaction_widget.dart';
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
                  flex: 3,
                  fit: FlexFit.tight,
                ),
                VerticalDivider(color: Colors.indigoAccent,),
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

  void OnSubmit(String chat) {
    chatLog.add(ChatLog(chat: chat, profile: profile,));
    chatController.text = "";
    setState(() {});
  }
  

  Widget buildProfile(Profile pr) {
    return TouchReaction(
      onTap: (){
        if(pr == profile){
          print('same');
        }
        else {
          showModalBottomSheet(context: context, builder: (_context){
            return ButtonActionBottomSheet(title: '개인 채팅',
                deniedText: '예', acceptText: '아니오',
                onTapDeniedButton: (){},
                onTapAcceptButton: (){},
                contents: Text('개인 채팅으로 이동하겠습니까?'));
          });
          /// TODO 팝업 띄우고,
          /// 다른 화면으로 넘어갑니다. 1:1 채팅.
        };
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all()
        ),
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Row(
            children: [
              Image.network(
                profile.imgUrl,
                width: 20,
                height: 20,
              ),
              Flexible(child: Text(profile.name,
                maxLines: 1, overflow: TextOverflow.ellipsis,)),
            ],
          ),
        ),
      ),
    );
  }
}
