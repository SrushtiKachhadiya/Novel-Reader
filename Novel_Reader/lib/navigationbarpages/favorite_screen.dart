import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project_4/dashboardpages/novel_slider.dart';
import 'package:project_4/provider/favouritebook_provider.dart';
import 'package:provider/provider.dart';

import '../dashboardpages/book_detail_screen.dart';
import '../models/category_Model.dart';

class FavoriteScreen extends StatefulWidget {
  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
//  List<Novel>book=[];

  @override
  Widget build(BuildContext context) {
    final favouriteProvider = Provider.of<FavoriteBookProvider>(context);
//print(book);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          'Favorite Novels',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
            ),
            NovelSlider(),
            Padding(
              padding: const EdgeInsets.only(top: 10, right: 200),
              child: Text(
                'My Favorite Novels',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
            Divider(
              height: 20,
              thickness: 3,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection("Favourite")
                      .snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: const CircularProgressIndicator());
                    }
                    final userSnapshot = snapshot.data?.docs;
                    if (userSnapshot!.isEmpty) {
                      return Center(
                        child: Container(
                            height: 400,
                            width: 400,
                            child: Image.asset(
                              'assets/images/Book lovers tattoo idea.png',
                              fit: BoxFit.cover,
                            )),
                      );
                    }

                    return ListView.builder(
                      itemCount: userSnapshot.length,
                      itemBuilder: (context, index) {
                        // Access the document data using the data() method
                        final data = userSnapshot[index].data() as Map<String,
                            dynamic>?; // Cast data to Map<String, dynamic>
                        print("Document ID: ${userSnapshot[index].id}");
                        print("Document Data: $data");

                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (contex) =>
                                        // Drama()));
                                        BookDetailScreen(
                                            data["Novel"]["description"] ?? "",
                                            data["Novel"]["title"] ?? "",
                                            data["Novel"]["imageLink"] ?? "",
                                            data["Novel"]["author"] ?? "",
                                            data["Novel"]["language"] ?? "",
                                            data["Novel"]["amazon"] ?? "",
                                            data["Novel"]["flipkart"] ?? "",
                                            data["Novel"]["bN"] ?? "",
                                            data["Novel"]["snapdeal"] ?? "",
                                            data["Novel"]["amazonPrice"] ?? "",
                                            data["Novel"]["flipkartPrice"] ??
                                                "",
                                            double.tryParse(data["Novel"]
                                                    ["bNPrice"]
                                                .toString()),
                                            data["Novel"]["snapdealPrice"] ??
                                                "",
                                            data["Novel"]["hashCode"] ?? "",
                                            Novel.fromJson(data["Novel"]))));
                          },
                          child: Container(
                            padding: const EdgeInsets.only(left: 20.0, top: 8),
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              children: [
                                Container(
                                  height: 130,
                                  width: 90,
                                  child:
                                      //    Image.network,),
                                      Image.network(
                                    data!["Novel"]["imageLink"] != null
                                        ? data["Novel"]["imageLink"]
                                        : 'No Title',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context).size.width * 0.65,
                                          child: Text(
                                            data["Novel"]["title"] ??
                                                'No Title',
                                            style: TextStyle(
                                                fontSize: 19,
                                                fontWeight: FontWeight.w500,
                                                overflow:
                                                    TextOverflow.ellipsis),
                                          ),
                                        ),
                                        Text(
                                          data["Novel"]["author"] ?? 'No Title',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.grey.shade700),
                                        ),
                                        SizedBox(
                                          height: 80,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }),
            )
            /*favouriteProvider.selectedBook.isEmpty
                ? Center(
                    child: Container(
                        height: 400,
                        width: 400,
                        child: Image.asset(
                          'assets/images/Book lovers tattoo idea.png',
                          fit: BoxFit.cover,
                        )),
                  )
                : Expanded(
                    child: ListView.builder(
                      itemCount: favouriteProvider.selectedBook.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 20.0, top: 8),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              children: [
                                Container(
                                  height: 130,
                                  width: 90,
                                  child:
                                      //    Image.network,),
                                      Image.asset(
                                    'assets/images/phpThumb_generated_thumbnail.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 270,
                                          child: Text(
                                            "I don't love you anymore",
                                            style: TextStyle(
                                                fontSize: 19,
                                                fontWeight: FontWeight.w500,
                                                overflow:
                                                    TextOverflow.ellipsis),
                                          ),
                                        ),
                                        Text(
                                          "Rithvik Singh",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.grey.shade700),
                                        ),
                                        SizedBox(
                                          height: 68,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),*/
          ],
        ),
      ),
    );
  }
}
