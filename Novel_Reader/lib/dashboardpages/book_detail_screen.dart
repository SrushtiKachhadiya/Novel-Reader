import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project_4/provider/favouritebook_provider.dart';
import 'package:project_4/provider/librarybook_provider.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share/share.dart';

import '../models/category_Model.dart';

class BookDetailScreen extends StatefulWidget {
  // BookScreen(this.book);

  var description = '';
  var title = '';
  var imageLink = '';
  var author = '';
  var language = '';
  var amazon = '';
  var flipkart = '';
  var bN = '';
  var snapdeal = '';
  var amazonPrice;

  var flipkartPrice;
  double? bNPrice;
  var snapdealPrice;
  var index;
  Novel mainNovel;

  BookDetailScreen(
      this.description,
      this.title,
      this.imageLink,
      this.author,
      this.language,
      this.amazon,
      this.flipkart,
      this.bN,
      this.snapdeal,
      this.amazonPrice,
      this.flipkartPrice,
      this.bNPrice,
      this.snapdealPrice,
      this.index,
      this.mainNovel);

  @override
  State<BookDetailScreen> createState() => _BookScreenState();
}

class _BookScreenState extends State<BookDetailScreen> {
  bool isFavourite = true;
  bool isAdd = true;

  bool isAdded = false;

  //List<int>index=[];

//  int index=0;

  _launchURLApp() async {
    var url = Uri.parse(widget.amazon);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchURLApp1() async {
    var url = Uri.parse(widget.flipkart);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchURLApp2() async {
    var url = Uri.parse(widget.bN);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchURLApp3() async {
    var url = Uri.parse(widget.snapdeal);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void shareContent() {
    Share.share('Check out this awesome content!');
  }

  @override
  Widget build(BuildContext context) {
    print("imageLink ====> " + widget.imageLink);
    // print( widget.book.length);
    print(widget.bNPrice);
    // double convertedPrice = widget.bNPrice * 75.5;
    // print(convertedPrice);



    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(13.0),
            child: InkWell(
              onTap: () {
                shareContent();
              },
              child: Icon(
                Icons.share,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Container(
                    height: 280,
                    width: 180,
                    child: Image.network(widget.imageLink, fit: BoxFit.cover),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(child: Center(
                child: updateFutureBuilder(),
              ),),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, left: 16, right: 8),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 320,
                        child: Text(
                          widget.title,
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              overflow: TextOverflow.ellipsis),
                        ),
                      ),
                      updateFavouriteBuilder()
                      /*Consumer<FavoriteBookProvider>(
                        builder: (context, value, child) {
                          return IconButton(
                            icon: Icon(
                              value.selectedBook.contains(widget.index)
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              size: 30,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            onPressed: () {
                              if (value.selectedBook.contains(widget.index)) {
                                value.removeBook(widget.index);
                                print('remove');
                              } else {
                                value.addBook(widget.index);
                                print('add');
                              }
                            },
                          );
                        },
                      ),*/
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(
                  widget.language,
                  style: TextStyle(fontSize: 15, color: Colors.grey),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ReadMoreText(
                  widget.description,
                  trimLines: 3,
                  style: TextStyle(color: Colors.black),
                  colorClickableText: Colors.blueGrey.shade500,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: 'Read more',
                  trimExpandedText: 'Show less',
                ),
              ),
              Center(
                child: Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width*0.95,
                        padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      color: Colors.blueGrey.shade50,
                      borderRadius: BorderRadius.circular(11)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 13),
                    child: Row(
                      children: [
                        CircleAvatar(
                          child: FaIcon(
                            FontAwesomeIcons.pen,
                            color: Colors.blueGrey.shade100,
                            size: 16,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          child: Text(
                            widget.author,
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                overflow: TextOverflow.ellipsis),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Divider(
                thickness: 7,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.shopping_bag_rounded,
                      color: Theme.of(context).colorScheme.primary,
                      size: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Purchase Now',
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  _launchURLApp();
                },
                child: widget.amazonPrice != null
                    ? Padding(
                        padding: const EdgeInsets.only(
                            top: 8.0, right: 8, left: 20, bottom: 8),
                        child: Row(
                          children: [
                            Container(
                              height: 80,
                              width: 80,
                              child: Image.asset(
                                'assets/images/d2252d_4c1a1bda6a774bd68f789c0770fd16e5~mv2.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Amazon',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  Text(
                                    'Latest Edition Buy Now',
                                    style: TextStyle(fontSize: 17),
                                  ),
                                  Text(
                                    widget.amazonPrice,
                                    style: TextStyle(fontSize: 16),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    : Container(),
              ),
              InkWell(
                onTap: () {
                  _launchURLApp1();
                },
                child: widget.flipkartPrice != null
                    ? Padding(
                        padding: const EdgeInsets.only(
                            top: 8.0, right: 8, left: 20, bottom: 8),
                        child: Row(
                          children: [
                            Container(
                              height: 80,
                              width: 80,
                              child: Image.asset(
                                'assets/images/channels4_profile.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Flipkart',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  Text(
                                    'Latest Edition Buy Now',
                                    style: TextStyle(fontSize: 17),
                                  ),
                                  Text(
                                    widget.flipkartPrice,
                                    style: TextStyle(fontSize: 16),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    : Container(),
              ),
              InkWell(
                onTap: () {
                  _launchURLApp3();
                },
                child: widget.snapdealPrice != null
                    ? Padding(
                        padding: const EdgeInsets.only(
                            top: 8.0, right: 8, left: 20, bottom: 8),
                        child: Row(
                          children: [
                            Container(
                              height: 80,
                              width: 80,
                              child: Image.asset(
                                'assets/images/Snapdeal_Logo_new.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Snapdeal',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  Text(
                                    'Latest Edition Buy Now',
                                    style: TextStyle(fontSize: 17),
                                  ),
                                  Text(
                                    widget.snapdealPrice,
                                    style: TextStyle(fontSize: 16),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    : Container(),
              ),
              InkWell(
                onTap: () {
                  _launchURLApp2();
                },
                child: widget.bNPrice != null
                    ? Padding(
                        padding: const EdgeInsets.only(
                            top: 8.0, right: 8, left: 20, bottom: 8),
                        child: Row(
                          children: [
                            Container(
                              height: 80,
                              width: 80,
                              child: Image.asset(
                                'assets/images/65b6017bd5aac_com.barnesandnoble.app.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Barnes & Nobles',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  Text(
                                    'Latest Edition Buy Now',
                                    style: TextStyle(fontSize: 17),
                                  ),
                                  Text(
                                    // widget.bNPrice,
                                    'Rs.${(widget.bNPrice! * 75.5).toStringAsFixed(2)}',
                                    // widget.bNPrice != null
                                    //     ? 'Rs.${(widget.bNPrice! * 75.5).toStringAsFixed(2)}'
                                    //     : 'Price unavailable',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    : Container(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget updateFutureBuilder() {

    CollectionReference library = FirebaseFirestore.instance.collection('Library');

    return FutureBuilder<DocumentSnapshot>(
      future: library.doc(widget.title).get(),
      builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(); // Placeholder while loading
        } else if (snapshot.hasData && snapshot.data!.exists) {
          if (!isAdded) {
            isAdded = true; // Update state
          }
          return buildButton(context, 'Added', Theme.of(context).colorScheme.primary, Colors.blueGrey.shade100, Icons.check_circle, () {
            // Delete data from Firestore
            library.doc(widget.title).delete().then((value) {
              setState(() {
                isAdded = false;
                updateFutureBuilder();
              });
            });
          });
        } else {
          if (isAdded) {
            isAdded = false; // Update state
          }
          return buildButton(context, 'Library', Colors.blueGrey.shade100, Theme.of(context).colorScheme.primary, Icons.add_circle_outline, () {
            // Add data to Firestore
            library.doc(widget.title).set({'Novel': widget.mainNovel.toJson()}).then((value) {
              setState(() {
                isAdded = true;
                updateFutureBuilder();
              });
            });
          });
        }
      },
    );

  }


  Widget updateFavouriteBuilder() {

    CollectionReference library = FirebaseFirestore.instance.collection('Favourite');

    return FutureBuilder<DocumentSnapshot>(
      future: library.doc(widget.title).get(),
      builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(); // Placeholder while loading
        } else if (snapshot.hasData && snapshot.data!.exists) {
          if (!isAdded) {
            isAdded = true; // Update state
          }
          return iconFavoriteButton(context, Icons.favorite, () {
            // Delete data from Firestore
            library.doc(widget.title).delete().then((value) {
              setState(() {
                isAdded = false;
                updateFavouriteBuilder();
              });
            });
          });
        } else {
          if (isAdded) {
            isAdded = false; // Update state
          }
          return iconFavoriteButton(context, Icons.favorite_border, () {
            // Add data to Firestore
            library.doc(widget.title).set({'Novel': widget.mainNovel.toJson()}).then((value) {
              setState(() {
                isAdded = true;
                updateFavouriteBuilder();
              });
            });
          });
        }
      },
    );

  }

  Widget iconFavoriteButton(BuildContext context, IconData icon,Function() onPressed) {

    return IconButton(
      icon: Icon(
        icon,
        size: 30,
        color: Theme.of(context).colorScheme.primary,
      ),
      onPressed: onPressed,
    );

  }


  Widget buildButton(BuildContext context, String buttonText, Color buttonColor, Color iconColor, IconData icon, Function() onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Stack(
        children: [
          Container(
            height: 40,
            width: 130,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: Theme.of(context).colorScheme.primary, width: 2),
              color: buttonColor,
            ),
          ),
          Positioned(
            left: 20,
            top: 9,
            child: Icon(
              icon,
              color: iconColor,
              size: 20,
            ),
          ),
          Positioned(
            top: 7,
            right: 27,
            child: Text(
              buttonText,
              style: TextStyle(
                color: iconColor,
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
