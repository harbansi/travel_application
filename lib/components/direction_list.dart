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
    return Container(
      height: 100,
      child: Row(
        children: [
          for (var i = 0; i < widget.directionList.length; i++)
            Container(
              child: Row(
                children: [
                  // Text(
                  //   "Distance from Airpot and railway Station",
                  //   style: TextStyle(color: Colors.black87, fontSize: 15),
                  // ),
                  Text(
                    "${widget.directionList[i]}",
                    maxLines: 3,
                  ),
                ],
              ),
            )
        ],
      ),
    );
  }
}
