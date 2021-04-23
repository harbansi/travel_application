import 'package:flutter/material.dart';
import 'package:travel_application/components/app_bar.dart';
import 'package:travel_application/components/drawer.dart';

class Bookmark extends StatefulWidget {
  @override
  _BookmarkState createState() => _BookmarkState();
}

class _BookmarkState extends State<Bookmark> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar("Bookmark"),
      body: Container(
        child: Stack(
          children: <Widget>[
            Center(
              child: Text('Bookmark '),
            ),
            // CustomAppBar(
            //   title: "Bookmark",
            //   hasBackArrow: false,
            // ),
          ],
        ),
      ),
    );
  }
}
