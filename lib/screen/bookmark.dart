import 'dart:html' as html;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:travel_application/components/app_bar.dart';
import 'package:travel_application/components/drawer.dart';
import 'package:travel_application/services/firebase_crud.dart';
import 'package:travel_application/constants.dart';

class Bookmark extends StatefulWidget {
  @override
  _BookmarkState createState() => _BookmarkState();
}

class _BookmarkState extends State<Bookmark> {
  CrudMethods crudMethods = CrudMethods();
  // user ->userId (document)->save
  //

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar("Bookmark"),
      body: Container(
        child: Stack(
          children: <Widget>[
            FutureBuilder<QuerySnapshot>(
              future: crudMethods.userRef
                  .doc(crudMethods.getUserId())
                  .collection('bookmark')
                  .get(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Scaffold(
                    body: Center(
                      child: Text("Error: ${snapshot.error}"),
                    ),
                  );
                }

                // Collection Data ready to display
                if (snapshot.connectionState == ConnectionState.done) {
                  // Display the data inside a list view
                  return ListView(
                    padding: EdgeInsets.only(
                      top: 108.0,
                      bottom: 12.0,
                    ),
                    children: snapshot.data.docs.map((document) {
                      return GestureDetector(
                          // onTap: () {
                          //   Navigator.push(context, MaterialPageRoute(
                          //     builder: (context) => ProductPage(productId: productId,),
                          //   ));
                          // },
                          child: FutureBuilder(
                              future: crudMethods.destinationRef
                                  .doc(document.id)
                                  .get(),
                              builder: (context, bookmarksnap) {
                                if (bookmarksnap.error) {
                                  return Container(
                                    child: Center(
                                      child: Text(bookmarksnap.error),
                                    ),
                                  );
                                }

                                if (bookmarksnap.connectionState ==
                                    ConnectionState.done) {
                                  Map _bookmarkMap = bookmarksnap.data.data();

                                  return Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    margin: EdgeInsets.symmetric(
                                        vertical: 12, horizontal: 24),
                                    child: Container(
                                      child: Text("${_bookmarkMap['title']}"),
                                    ),
                                  );
                                }
                                return Container(
                                  child: Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                );
                              })
                          //  Stack(
                          //   children: [
                          //     Container(
                          //       height: 350.0,
                          //       child: ClipRRect(
                          //         borderRadius: BorderRadius.circular(12.0),
                          //         child: Image.network(
                          //           document.data()['imgURL'][0],
                          //           fit: BoxFit.cover,
                          //         ),
                          //       ),
                          //     ),
                          //     Positioned(
                          //       bottom: 0,
                          //       left: 0,
                          //       right: 0,
                          //       child: Padding(
                          //         padding: const EdgeInsets.all(24.0),
                          //         child: Row(
                          //           mainAxisAlignment:
                          //               MainAxisAlignment.spaceBetween,
                          //           children: [
                          //             Text(
                          //               document.data()['title'],
                          //               style: constant.regularHeading,
                          //             ),
                          //             Text(
                          //               "${document.data()['rating']}",
                          //               style: TextStyle(
                          //                   fontSize: 18.0,
                          //                   color:
                          //                       Theme.of(context).accentColor,
                          //                   fontWeight: FontWeight.w600),
                          //             ),
                          //           ],
                          //         ),
                          //       ),
                          //     )
                          //   ],
                          // ),

                          );
                    }).toList(),
                  );
                }

                // Loading State
                return Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
