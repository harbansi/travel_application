import 'package:flutter/material.dart';

class ShowBLog extends StatefulWidget {
  final String blogId;

  ShowBLog({this.blogId});
  @override
  _ShowBLogState createState() => _ShowBLogState();
}

class _ShowBLogState extends State<ShowBLog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text("ID: ${widget.blogId}"),
        ),
      ),
    );
  }
}
