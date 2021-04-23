import 'package:flutter/material.dart';

class DirectionList extends StatefulWidget {
  final List directionList;
  DirectionList({this.directionList});
  @override
  _DirectionListState createState() => _DirectionListState();
}

class _DirectionListState extends State<DirectionList> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (var i = 0; i < widget.directionList.length; i++)
          Container(
            child: Text("${widget.directionList[i]}"),
          )
      ],
    );
  }
}
