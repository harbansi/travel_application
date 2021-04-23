import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_application/screen/subScreen/destinationPage.dart';

class BeachScreen extends StatefulWidget {
  @override
  _BeachScreenState createState() => _BeachScreenState();
}

class _BeachScreenState extends State<BeachScreen> {
  final Query desRefBeach = FirebaseFirestore.instance
      .collection("destination_collection")
      .where("type", isEqualTo: "beach");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Stack(
          children: <Widget>[
            Container(
              child: Text(
                "beaches",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            //featured palces container
            FutureBuilder<QuerySnapshot>(
              future: desRefBeach.get(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Scaffold(
                    body: Center(
                      child: Text("Error : ,${snapshot.error}"),
                    ),
                  );
                }

                //collection data ready to display

                if (snapshot.connectionState == ConnectionState.done) {
                  return ListView(
                    shrinkWrap: true,
                    children: snapshot.data.docs.map((document) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DestinationPage(
                                destinationId: document.id,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          height: 200,
                          margin: EdgeInsets.only(top: 80, right: 10),
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                //child: Image.asset(imgData,
                                //"images/abd.png",
                                child: CachedNetworkImage(
                                    imageUrl: document.data()['imgURL'][0],
                                    filterQuality: FilterQuality.low,
                                    color: Colors.white.withOpacity(0.7),
                                    colorBlendMode: BlendMode.dst,
                                    height: 200,
                                    width: 170,
                                    fit: BoxFit.cover),
                              ),
                              Container(
                                height: 240,
                                width: 170,
                                child: Column(
                                  children: [
                                    Row(
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.only(
                                              top: 164, left: 6),
                                          //padding: EdgeInsets.only(top: 210),
                                          child: Text(
                                              document.data()['title'] ??
                                                  "Title",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14)),
                                        ),
                                        Spacer(),
                                        Container(
                                          alignment: Alignment.center,
                                          margin: EdgeInsets.only(
                                            top: 162,
                                            right: 4,
                                          ),
                                          padding: EdgeInsets.symmetric(
                                              vertical: 8, horizontal: 8),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              backgroundBlendMode:
                                                  BlendMode.colorDodge,
                                              color: Colors.white60),
                                          child: Row(
                                            children: [
                                              Text(
                                                document
                                                    .data()['rating']
                                                    .toString(),
                                                style: TextStyle(
                                                    color: Colors.black87,
                                                    fontWeight: FontWeight.w800,
                                                    fontSize: 12),
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
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  );
                }
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
