import 'dart:async';

import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String hinText;
  final TextEditingController textEditingController;
  final bool hasBorder;
  final int? maxLines;
  final Function(String)? onSubmitted;
  final TextInputType? keyboardType;
  const CustomTextField(
      {Key? key,
        this.keyboardType,
        this.hinText = '',
        required this.textEditingController,
        this.hasBorder = true,
        this.maxLines,
        this.onSubmitted})
      : super(key: key);
  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late final StreamController<bool> activeStreamController;
  @override
  void initState() {
    activeStreamController = StreamController();
    widget.textEditingController
      ..addListener(() {
        activeStreamController.add(widget.textEditingController.text != '');
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
        stream: activeStreamController.stream,
        initialData: false,
        builder: (context, snapshot) {
          bool isActive = snapshot.data!;
          var color = Colors.grey;
          return TextField(
            maxLines: widget.maxLines,
            onSubmitted: widget.onSubmitted,
            keyboardType: widget.keyboardType,
            decoration: InputDecoration(
              isDense: true,
              enabledBorder: widget.hasBorder
                  ? OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(width: 1, color: color))
                  : InputBorder.none,
              border: widget.hasBorder
                  ? OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(width: 1, color: color))
                  : InputBorder.none,
              focusedBorder: widget.hasBorder
                  ? OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    width: 1,
                    color: Colors.black,
                  ))
                  : InputBorder.none,
              hoverColor: Colors.black,
              focusColor: Colors.black,
              contentPadding:
              EdgeInsets.symmetric(vertical: 12, horizontal: 10),
              hintText: widget.hinText,
              hintStyle: TextStyle(fontSize: 14, letterSpacing: -0.5, color: Colors.black12),
            ),
            autocorrect: false,
            style: const TextStyle(fontSize: 14, letterSpacing: -0.5),
            controller: widget.textEditingController,
          );
        });
  }
}