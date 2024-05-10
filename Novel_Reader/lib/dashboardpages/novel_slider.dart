import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NovelSlider extends StatefulWidget {
  @override
  State<NovelSlider> createState() => _NovelSliderState();
}

class _NovelSliderState extends State<NovelSlider> {

  final image = [
    'assets/images/Blue Black White Modern Concept Story About You And Me Book Cover.png',
    'assets/images/Brown Rusty Mystery Novel Book Cover.png',
    'assets/images/Festive Illustration Christmas Market Book Cover.png',
    'assets/images/Yellow Fantasy Novel Book Cover-2.png',
    'assets/images/Elegant Girl Photo Romance Book Cover.png'
  ];

  @override
  Widget build (BuildContext context) {
    return  Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              height: 200.0,
              aspectRatio: 16 / 9,
              viewportFraction: 0.8,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              scrollDirection: Axis.horizontal,
            ),
            items: image.map((String imageUrl) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                    ),
                    child: Image.asset(
                      imageUrl,
                      fit: BoxFit.cover,
                    ),
                  );
                },
              );
            }).toList(),
          ),



          // SizedBox(
          //     height: 200,
          //     width: MediaQuery.of(context).size.width,
          //     child: PageView.builder(
          //         itemCount: image.length,
          //         clipBehavior: Clip.antiAlias,
          //         //physics: BouncingScrollPhysics(),
          //         onPageChanged: (value) {
          //           currentIndex = value;
          //           setState(() {});
          //         },
          //         padEnds: false,
          //         controller: PageController(
          //           viewportFraction: 0.9
          //         ),
          //         itemBuilder: (context, index) {
          //           return Container(
          //             clipBehavior: Clip.antiAlias,
          //             margin: EdgeInsets.only(right: 7,left: 7),
          //             decoration: BoxDecoration(
          //                 borderRadius: BorderRadius.circular(15)),
          //             child: Image.asset(
          //               image[index],
          //               fit: BoxFit.cover,
          //             ),
          //           );
          //         }),
          //   ),
          
        ],
    );
  }
}
