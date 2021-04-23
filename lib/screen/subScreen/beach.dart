import 'package:flutter/material.dart';

class BeachScreen extends StatefulWidget {
  @override
  _BeachScreenState createState() => _BeachScreenState();
}

class _BeachScreenState extends State<BeachScreen> {
  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   backgroundColor: Colors.teal[400],
    //   body: SafeArea(
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.stretch,
    //       children: <Widget>[
    //         SizedBox(
    //           height: 40,
    //         ),
    //         Text(
    //           'Beaches',
    //           style: TextStyle(
    //             fontSize: 25,
    //             fontWeight: FontWeight.w600,
    //             color: Colors.white,
    //           ),
    //           textAlign: TextAlign.center,
    //         ),
    //         SizedBox(
    //           height: 35,
    //         ),
    //         Expanded(
    //           child: Container(
    //             padding: EdgeInsets.symmetric(
    //               horizontal: 20,
    //               vertical: 30,
    //             ),
    //             decoration: BoxDecoration(
    //               color: Colors.white,
    //               borderRadius: BorderRadius.only(
    //                 topLeft: Radius.circular(30),
    //                 topRight: Radius.circular(30),
    //               ),
    //             ),
    //             child: GridView.builder(
    //               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //                 crossAxisCount: 2,
    //                 crossAxisSpacing: 15,
    //                 mainAxisSpacing: 10,
    //               ),
    //               itemBuilder: (context, index) {
    //                 return RawMaterialButton(
    //                     onPressed: () {
    //                       Navigator.push(
    //                         context,
    //                         MaterialPageRoute(
    //                           builder: (context) => DetailsPage(
    //                             imagePath: _images[index].imagePath,
    //                             title: _images[index].title,
    //                             rating: _images[index].rating,
    //                             details: _images[index].details,
    //                             index: index,
    //                           ),
    //                         ),
    //                       );
    //                     },
    //                     child: Column(children: <Widget>[
    //                       Hero(
    //                           tag: 'logo$index',
    //                           child: Container(
    //                             child: Material(
    //                               color: Colors.transparent,
    //                               child: Column(children: <Widget>[
    //                                 Container(
    //                                   height: 150,
    //                                   child: ClipRRect(
    //                                       borderRadius:
    //                                           BorderRadius.circular(16),
    //                                       child: CachedNetworkImage(
    //                                         imageUrl: _images[index].imagePath,
    //                                         fit: BoxFit.cover,
    //                                       )),
    //                                 ),
    //                                 Container(
    //                                   child: Padding(
    //                                     padding: const EdgeInsets.all(3),
    //                                     child: Text(_images[index].title,
    //                                         textAlign: TextAlign.center,
    //                                         style: TextStyle(
    //                                             color: Colors.black,
    //                                             fontSize: 15,
    //                                             fontWeight: FontWeight.w500)),
    //                                   ),
    //                                 )
    //                               ]),
    //                             ),
    //                           ))
    //                     ]));
    //               },
    //               itemCount: _images.length,
    //             ),
    //           ),
    //         )
    //       ],
    //     ),
    //   ),
    // );
  }
}
