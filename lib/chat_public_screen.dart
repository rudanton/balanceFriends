import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatPublic extends StatefulWidget{
  @override
  _ChatPublic createState() => _ChatPublic();
}
class _ChatPublic extends State<ChatPublic>{
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
                Flexible(child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.only(left: 25),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('채팅 내용'),
                          Text('채팅 내용'),
                          Text('채팅 내용'),
                          Text('채팅 내용'),
                          Text('채팅 내용'),
                          Text('채팅 내용'),
                          Text('채팅 내용'),
                          Text('채팅 내용'),
                          Text('채팅 내용'),
                          Text('채팅 내용'),
                          Text('채팅 내용'),
                        ],
                      ),
                    )),
                flex: 4,
                fit: FlexFit.tight,),
                Flexible(child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Text('사용자.'),
                      ],
                    )),flex: 1,),

              ],
            ),
          ),
          Container(height: 1,
          decoration: BoxDecoration(
            border: Border.all()
          ),),
          Padding(
            padding: const EdgeInsets.symmetric(vertical : 20.0),
            child: Container(height: 20,),
          )
        ],
      ),
    );
  }
}