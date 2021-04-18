import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:travel_application/data/data.dart';
import 'package:travel_application/model/city_model.dart';
import 'package:travel_application/model/popular_tourmodel.dart';
import 'package:travel_application/auth/Start.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //for authentication
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool isloggedIn = false;
  User user;

  //check Aunthenticatin
  checkAuthentification() async {
    _auth.authStateChanges().listen((user) {
      if (user == null) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Start()));
      }
    });
  }

  //check getuser
  getUser() async {
    User firebaseUser = _auth.currentUser;
    await firebaseUser?.reload();
    firebaseUser = _auth.currentUser;

    if (firebaseUser != null) {
      setState(() {
        this.user = firebaseUser;
        this.isloggedIn = true;
      });
    }
  }

  //for app data
  List<CityModel> city = [];
  List<PopularTourModel> popularTourModels = [];

  @override
  void initState() {
    super.initState();
    this.checkAuthentification();
    this.getUser();

    city = getCity();
    popularTourModels = getPopularTours();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Find Your Best Place",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Featured Places",
              style: TextStyle(
                fontSize: 18,
                color: Colors.black45,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              height: 200,
              child: ListView.builder(
                  itemCount: city.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return FeaturedPlaceList(
                      name: city[index].name,
                      rating: city[index].rating,
                      imgData: city[index].imgData,
                    );
                  }),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              height: 25,
              child: Text(
                "Popular Tours",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black54,
                    fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: popularTourModels.length,
                  itemBuilder: (context, index) {
                    return PopularTours(
                      desc: popularTourModels[index].desc,
                      imgUrl: popularTourModels[index].imgUrl,
                      title: popularTourModels[index].title,
                      rating: popularTourModels[index].rating,
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

class PopularTours extends StatelessWidget {
  final String imgUrl;
  final String title;
  final String desc;
  final double rating;
  PopularTours({this.imgUrl, this.rating, this.desc, this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
          color: Color(0xffE9F4F9), borderRadius: BorderRadius.circular(20)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), bottomLeft: Radius.circular(20)),
            child: CachedNetworkImage(
              imageUrl: imgUrl,
              width: 100,
              height: 90,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff4E6059)),
                ),
                SizedBox(
                  height: 3,
                ),
                Container(
                  width: 200,
                  child: Text(
                    desc,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff89A097)),
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Column(
            children: [
              Container(
                  margin: EdgeInsets.only(bottom: 2, left: 2, right: 14),
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Color(0xff007580)),
                  child: Row(
                    children: [
                      Text(
                        "$rating",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 12),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        CupertinoIcons.star,
                        color: Colors.white,
                        size: 14,
                      )
                    ],
                  )),
            ],
          ),
        ],
      ),
    );
  }
}

class FeaturedPlaceList extends StatelessWidget {
  final String name;
  final double rating;
  final String imgData;
  FeaturedPlaceList({this.name, this.rating, this.imgData});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 14),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            //child: Image.asset(imgData,
            //"images/abd.png",
            child: CachedNetworkImage(
                imageUrl: imgData,
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
                      margin: EdgeInsets.only(top: 164, left: 6),
                      //padding: EdgeInsets.only(top: 210),
                      child: Text(name,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w800,
                              fontSize: 16)),
                    ),
                    Spacer(),
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(
                        top: 162,
                        right: 4,
                      ),
                      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          backgroundBlendMode: BlendMode.colorDodge,
                          color: Colors.white60),
                      child: Row(
                        children: [
                          Text(
                            rating.toString(),
                            style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.w800,
                                fontSize: 14),
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
    );
  }
}
