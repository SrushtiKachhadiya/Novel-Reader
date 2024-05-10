import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project_4/models/category_Model.dart';
import 'package:project_4/provider/librarybook_provider.dart';
import 'package:provider/provider.dart';

import '../dashboardpages/book_detail_screen.dart';

class LibraryScreen extends StatefulWidget {
  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: Text(
            'My Library',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: StreamBuilder<QuerySnapshot>(
            stream:
                FirebaseFirestore.instance.collection("Library").snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: const CircularProgressIndicator());
              }
              final userSnapshot = snapshot.data?.docs;
              if (userSnapshot!.isEmpty) {
                return Image.asset('assets/images/_-2-removebg-preview.png');
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
                                      data["Novel"]["flipkartPrice"] ?? "",
                                      double.tryParse(
                                          data["Novel"]["bNPrice"].toString()),
                                      data["Novel"]["snapdealPrice"] ?? "",
                                      data["Novel"]["hashCode"] ?? "",
                                      Novel.fromJson(data["Novel"]))));
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.only(left: 20.0, top: 8),
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
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.65,
                                    child: Text(
                                      data["Novel"]["title"] ?? 'No Title',
                                      style: TextStyle(
                                          fontSize: 19,
                                          fontWeight: FontWeight.w500,
                                          overflow: TextOverflow.ellipsis),
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
              );
            }));
  }
}
