import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:travel_application/components/app_bar.dart';
import 'package:travel_application/screen/subScreen/destinationPage.dart';
import 'package:travel_application/services/firebase_crud.dart';

class TempleScreen extends StatefulWidget {
  @override
  _TempleScreenState createState() => _TempleScreenState();
}

class _TempleScreenState extends State<TempleScreen> {
  CrudMethods crudMethods = CrudMethods();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(""),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 40,
            ),
            Text(
              'Temples',
              style: TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.w600,
                color: Color(0xff007580),
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 6),
              child: Container(
                margin: EdgeInsets.only(top: 30),
                child: FutureBuilder<QuerySnapshot>(
                  future: crudMethods.desRefTemple.get(),
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
                        scrollDirection: Axis.vertical,
                        physics: ClampingScrollPhysics(),
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
                              margin: EdgeInsets.only(bottom: 8),
                              decoration: BoxDecoration(
                                  color: Color(0xffE9F4F9),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        bottomLeft: Radius.circular(20)),
                                    child: CachedNetworkImage(
                                      imageUrl: document.data()['imgURL'][0],
                                      width: 200,
                                      height: 210,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Container(
                                    width: 198,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 8),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          document.data()['title'] ?? "title",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18),
                                        ),
                                        SizedBox(
                                          height: 3,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Spacer(),
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
