/**
 * HTML elements and other resources for web-based applications that need to
 * interact with the browser and the DOM (Document Object Model).
 *
 * This library includes DOM element types, CSS styling, local storage,
 * media, speech, events, and more.
 * To get started,
 * check out the [Element] class, the base class for many of the HTML
 * DOM types.
 *
 * For information on writing web apps with Dart, see https://dart.dev/web.
 *
 * {@category Web}
 */

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:travel_application/components/app_bar.dart';
import 'package:travel_application/components/drawer.dart';
import 'package:travel_application/screen/subScreen/createBlog.dart';
import 'package:travel_application/screen/subScreen/showBlog.dart';
import 'package:travel_application/services/firebase_crud.dart';
import 'package:travel_application/constants.dart';

class BlogPage extends StatefulWidget {
  @override
  _BlogPageState createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  CrudMethods crudMethods = new CrudMethods();

  Stream blogsStream;

  Widget BlogList() {
    return Container(
      child: blogsStream != null
          ? Column(
              children: <Widget>[
                StreamBuilder(
                  stream: blogsStream,
                  builder: (context, snapshot) {
                    return ListView.builder(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        itemCount: snapshot.data.docs.length,
                        physics: ClampingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return BlogTiles(
                            authorName:
                                snapshot.data.docs[index].data()['authorName'],
                            title: snapshot.data.docs[index].data()["title"],
                            description:
                                snapshot.data.docs[index].data()['description'],
                            imgURL: snapshot.data.docs[index].data()['imgURL'],
                            date: snapshot.data.docs[index].data()['date'],
                            time: snapshot.data.docs[index].data()['time'],
                          );
                        });
                  },
                )
              ],
            )
          : Container(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            ),
    );
  }

  @override
  void initState() {
    crudMethods.getData().then((result) {
      setState(() {
        blogsStream = result;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar("Blog"),
      body: SingleChildScrollView(
        child: BlogList(),
      ),
      floatingActionButton: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 25, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FloatingActionButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CreateBlog()));
                },
                child: Icon(Icons.add),
                backgroundColor: Color(0xff007580),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BlogTiles extends StatelessWidget {
  String imgURL, title, description, authorName, date, time;

  BlogTiles(
      {@required this.imgURL,
      @required this.title,
      @required this.description,
      @required this.authorName,
      @required this.date,
      @required this.time});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 5, top: 10),
      decoration: BoxDecoration(
          color: Colors.black45.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8), bottomLeft: Radius.circular(8)),
            child: CachedNetworkImage(
              imageUrl: imgURL,
              width: 175,
              height: 160,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: 200,
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title[0].toUpperCase() + title.substring(1),
                  overflow: TextOverflow.ellipsis,
                  style: constant.regularHeading,
                ),
                SizedBox(
                  height: 3,
                ),
                Container(
                  child: Text(
                    authorName[0].toUpperCase() + authorName.substring(1),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Colors.black54),
                  ),
                ),
                Container(
                  child: Text(
                    date,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Colors.black54),
                  ),
                ),
                Container(
                  child: Text(
                    time,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Colors.black54),
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
