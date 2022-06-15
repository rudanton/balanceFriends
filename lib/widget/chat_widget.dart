import 'package:balance_friends/models/profile.dart';
import 'package:flutter/cupertino.dart';

class ChatLog extends StatelessWidget{
  final Profile profile;
  final String chat;
  const ChatLog({
    Key? key, required this.profile, required this.chat
}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.all(5),
      child: Row(
        children: [
          Image.network(profile.imgUrl, width: 30, height: 30,),
          Expanded(child: Text('${profile.name} : $chat'))
        ],
      ),
    );
  }
}