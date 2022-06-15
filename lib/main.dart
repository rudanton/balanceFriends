import 'package:balance_friends/home_screen.dart';
import 'package:flutter/material.dart';

import 'chat_public_screen.dart';
import 'widget/touch_reaction_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/home' : (context)=>
            HomeScreen(),
        'chat/public' : (context)=>
            ChatPublic(),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Hello Friends!'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Center(
              child: Text("안녕하세요.\n 반갑습니다."),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              width: 80,
              height: 30,
              child: TouchReaction(
                  onTap: () {
                    Navigator.pushNamed(context, '/home');
                  }, child: Center(child: Text('접속하기'))),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.black, width: 2)),
            )
          ],
        ),
      ),
    );
  }
}
