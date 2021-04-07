import 'package:flutter/material.dart';

Widget drawer() {
  return Drawer(
    child: Container(
      child: Column(
        children: <Widget>[
          Container(
            height: 100,
            child: DrawerHeader(
              child: Center(
                child: Text(
                  'TRAVEL MATE',
                  style: TextStyle(),
                ),
              ),
              decoration: BoxDecoration(color: Color(0xff007580)),
            ),
          ),
        ],
      ),
    ),
  );
}
