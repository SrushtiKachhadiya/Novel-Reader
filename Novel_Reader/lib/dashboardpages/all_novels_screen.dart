import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:project_4/dashboardpages/book_detail_screen.dart';
import 'package:project_4/dashboardpages/more_book_screen.dart';
import 'package:project_4/dashboardpages/novel_slider.dart';
import 'package:project_4/models/category_Model.dart';
import 'package:http/http.dart' as http;

class AllNovelsScreen extends StatefulWidget {
  List<Datum> category = [];

  AllNovelsScreen(this.category);

  @override
  State<AllNovelsScreen> createState() => _NewScreenState();
}

class _NewScreenState extends State<AllNovelsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: ListView.builder(
          // scrollDirection: Axis.horizontal,
          itemCount: widget.category.length,
          itemBuilder: (contex, index) {
            print(widget.category);
            return Expanded(
              child: Column(
                children: [
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: widget.category[index].label != "More Novels"
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (contex) => MoreBookScreen(
                                                widget.category[index].novel,
                                                widget.category[index].label)));
                                  },
                                  child: Text(
                                    widget.category[index].label.toString(),
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 19,
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (contex) => MoreBookScreen(
                                                widget.category[index].novel,
                                                widget.category[index].label)));
                                  },
                                  child: Text('MORE',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 15,
                                          color: Colors.blueGrey.shade700)),
                                ),
                              ],
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (contex) =>
                                                  MoreBookScreen(
                                                      widget.category[index]
                                                          .novel,
                                                      widget.category[index]
                                                          .label)));
                                    },
                                    child: Text(
                                      widget.category[index].label.toString(),
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 19,
                                      ),
                                    ),
                                  ),
                                ])),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: widget.category[index].label != "More Novels"
                        ? Row(
                            // mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: List<Widget>.generate(
                              widget.category[index].novel.length,
                              (index1) {
                                return Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 8.0),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (contex) =>
                                              // Drama()));
                                              BookDetailScreen(
                                            widget.category[index].novel[index1]
                                                .description
                                                .toString(),
                                            widget.category[index].novel[index1]
                                                .title
                                                .toString(),
                                            widget.category[index].novel[index1]
                                                .imageLink,
                                            widget.category[index].novel[index1]
                                                .author
                                                .toString(),
                                            widget.category[index].novel[index1]
                                                .language
                                                .toString(),
                                            widget.category[index].novel[index1]
                                                .amazon
                                                .toString(),
                                            widget.category[index].novel[index1]
                                                .flipkart
                                                .toString(),
                                            widget.category[index].novel[index1]
                                                .bN
                                                .toString(),
                                            widget.category[index].novel[index1]
                                                .snapdeal
                                                .toString(),
                                            widget.category[index].novel[index1]
                                                .amazonPrice,
                                            widget.category[index].novel[index1]
                                                .flipkartPrice,
                                            double.tryParse(widget.category[index].novel[index1].bNPrice.toString()),
                                            //double.parse(widget.category[index].novel[index1].bNPrice.toString()),
                                            widget.category[index].novel[index1]
                                                .snapdealPrice,
                                            widget.category[index].novel[index1].hashCode,
                                                  widget.category[index].novel[index1]
                                              ),
                                        ),
                                      );
                                    },
                                    child: Column(
                                      // crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                              top: 10, bottom: 2),
                                          height: 200,
                                          width: 130,
                                          child: Image.network(
                                            widget.category[index].novel[index1]
                                                .imageLink,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 130,
                                          child: Text(
                                            widget.category[index].novel[index1]
                                                .title,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 130,
                                          child: Text(
                                            widget.category[index].novel[index1]
                                                .author,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                        : Column(
                            children: List<Widget>.generate(
                              widget.category[index].novel.length,
                              (index2) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                    bottom: 8,
                                  ),
                                  child: Column(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (contex) =>
                                                  // Drama()));
                                                  BookDetailScreen(
                                                      widget
                                                          .category[index]
                                                          .novel[index2]
                                                          .description
                                                          .toString(),
                                                      widget.category[index]
                                                          .novel[index2].title
                                                          .toString(),
                                                      widget
                                                          .category[index]
                                                          .novel[index2]
                                                          .imageLink,
                                                      widget.category[index]
                                                          .novel[index2].author
                                                          .toString(),
                                                      widget
                                                          .category[index]
                                                          .novel[index2]
                                                          .language
                                                          .toString(),
                                                      widget.category[index]
                                                          .novel[index2].amazon
                                                          .toString(),
                                                      widget
                                                          .category[index]
                                                          .novel[index2]
                                                          .flipkart
                                                          .toString(),
                                                      widget.category[index]
                                                          .novel[index2].bN
                                                          .toString(),
                                                      widget
                                                          .category[index]
                                                          .novel[index2]
                                                          .snapdeal
                                                          .toString(),
                                                      widget
                                                          .category[index]
                                                          .novel[index2]
                                                          .amazonPrice,
                                                      widget
                                                          .category[index]
                                                          .novel[index2]
                                                          .flipkartPrice,
                                                      double.tryParse(widget
                                                          .category[index]
                                                          .novel[index2]
                                                          .bNPrice.toString()),
                                                      widget
                                                          .category[index]
                                                          .novel[index2]
                                                          .snapdealPrice,
                                                      widget
                                                          .category[index]
                                                          .novel[index2]
                                                          .hashCode,widget
                                                      .category[index]
                                                      .novel[index2]),
                                            ),
                                          );
                                        },
                                        child: Row(
                                          children: [
                                            Container(
                                              child: Image.network(
                                                widget.category[index]
                                                    .novel[index2].imageLink,
                                                fit: BoxFit.cover,
                                              ),
                                              height: 150,
                                              width: 100,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 4.0,
                                                            bottom: 4),
                                                    child: Container(
                                                      width: 280,
                                                      child: Text(
                                                        widget
                                                            .category[index]
                                                            .novel[index2]
                                                            .title,
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 19,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            bottom: 4.0),
                                                    child: Container(
                                                      width: 280,
                                                      child: Text(
                                                          widget
                                                              .category[index]
                                                              .novel[index2]
                                                              .author,
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize: 15,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis)),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 280,
                                                    child: Text(
                                                      widget
                                                          .category[index]
                                                          .novel[index2]
                                                          .description,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      maxLines: 4,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      // Padding(
                                      //   padding: const EdgeInsets.all(8.0),
                                      //   child: Container(
                                      //     height: 2,
                                      //     width: 390,
                                      //     color: Colors.grey.shade400
                                      //   ),
                                      // )
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                  ),
                  widget.category[index].label != "More Novels"
                      ? Divider(thickness: 7)
                      : Padding(padding: EdgeInsets.zero)
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
