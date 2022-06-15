import 'package:flutter/material.dart';

class ButtonActionBottomSheet extends StatelessWidget {
  final String title;
  final Widget contents;
  final String deniedText;
  final String acceptText;
  final Function() onTapDeniedButton;
  final Function() onTapAcceptButton;

  const ButtonActionBottomSheet({
    Key? key,
    required this.title,
    required this.deniedText,
    required this.acceptText,
    required this.onTapDeniedButton,
    required this.onTapAcceptButton,
    required this.contents,
  }) : super(key: key);

  Widget _buildTitle(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 13, horizontal: 20),
        child: Text(
          title,
          style: TextStyle(
              fontSize: 16,
              letterSpacing: -0.5,
              height: 1.3,
              color: Colors.grey,
              fontWeight: FontWeight.bold),
        ));
  }

  Widget _buildContents() {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 13, horizontal: 20),
        child: contents);
  }

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
        backgroundColor: Colors.transparent,
        onClosing: () {},
        builder: (_) {
          return SingleChildScrollView(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              _buildTitle(context),
              SizedBox(
                height: 10,
              ),
              _buildContents(),
              _buildActionButtons(context)
            ]),
          );
        });
  }

  Widget _buildActionButtons(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Expanded(
              child: ElevatedButton(
            child: Text('아니오'),
            onPressed: () {
              onTapDeniedButton();
              Navigator.of(context).pop();
            },
          )),
          SizedBox(
            width: 20,
          ),
          Expanded(
              child: ElevatedButton(
            child: Text('예'),
            onPressed: () {
              onTapAcceptButton();
              Navigator.of(context).pop();
            },
          )),
        ],
      ),
    );
  }
}
