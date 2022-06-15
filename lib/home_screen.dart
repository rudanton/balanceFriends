import 'package:balance_friends/chat_public_screen.dart';
import 'package:balance_friends/widget/text_feild.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'models/profile.dart';

class HomeScreen extends StatefulWidget{
  @override
  _HomeScreen createState() => _HomeScreen();
}
class _HomeScreen extends State<HomeScreen>
{
  bool isEdit = false;
  late Profile profile;
  late TextEditingController nameEditor;
  @override
  void initState(){
    profile = Profile(name: '사용자');
    nameEditor = TextEditingController(text: profile.name);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("홈화면"),
        ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 50),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                      child: Image.network(profile.imgUrl,
                      width: 40, height: 80,)),
                ),
                SizedBox(width: 20,),
                Expanded(child: Text('${profile.name} 님')),
              ],
            ),
          ),
          if(isEdit)CustomTextField(textEditingController: nameEditor),
          ElevatedButton(onPressed: (){
            setState(() {

            });
            if(!isEdit){
                  isEdit = true;
                }
            else {
              isEdit = false;
              profile.name = nameEditor.text;
            }
              }, child: Text('프로필 수정')),
          Expanded(child: Container()),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: ElevatedButton(onPressed: (){
              Navigator.pushNamed(context, 'chat/public',
              arguments: ChatPublicArgument(profile: profile));
            }, child: Container(
              child: Text('채팅방 입장.'),
            )),
          )
        ],
      ),
    );
  }
}