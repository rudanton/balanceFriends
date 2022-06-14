import 'package:balance_friends/chat_public_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget{
  @override
  _HomeScreen createState() => _HomeScreen();
}
class _HomeScreen extends State<HomeScreen>
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
                      border: Border.all()
                  ),
                ),
                SizedBox(width: 20,),
                Expanded(child: Text('사용자 님')),
              ],
            ),
          ),
          Expanded(child: Container()),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: ElevatedButton(onPressed: (){
              Navigator.pushNamed(context, 'chat/public');
            }, child: Container(
              child: Text('채팅방 입장.'),
            )),
          )
        ],
      ),
    );
  }
}