import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_application/components/app_bar.dart';
import 'package:travel_application/constants.dart';

class DestinationPage extends StatefulWidget {
  final String destinationId;
  DestinationPage({this.destinationId});
  @override
  _DestinationPageState createState() => _DestinationPageState();
}

class _DestinationPageState extends State<DestinationPage> {
  final CollectionReference destinationRef1 =
      FirebaseFirestore.instance.collection("destination_collection");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(""),
      body: Stack(
        children: <Widget>[
          FutureBuilder(
            future: destinationRef1.doc(widget.destinationId).get(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Scaffold(
                  body: Center(
                    child: Text("Error : ,${snapshot.error}"),
                  ),
                );
              }
              if (snapshot.connectionState == ConnectionState.done) {
                Map<String, dynamic> documentData = snapshot.data.data();
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  child: ListView(
                    children: [
                      Container(
                        height: 300,
                        decoration: BoxDecoration(
                            color: Colors.black45.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            "${documentData['imgURL'][0]}",
                            height: 300,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        child: Row(
                          children: [
                            Container(
                              child: Text("${documentData['title']}",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black)),
                            ),
                            Spacer(),
                            Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  backgroundBlendMode: BlendMode.colorDodge,
                                  color: Colors.white60),
                              child: Row(
                                children: [
                                  Text(
                                    "Rating: ${documentData['rating'].toString()}",
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w800,
                                        fontSize: 17),
                                  ),
                                  SizedBox(
                                    width: 3,
                                  ),
                                  Icon(
                                    CupertinoIcons.star,
                                    color: Colors.black54,
                                    size: 14,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Description: ",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w800,
                            fontSize: 15),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        child: Text(documentData['desc']),
                      )
                    ],
                  ),
                );
              }
              return Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
