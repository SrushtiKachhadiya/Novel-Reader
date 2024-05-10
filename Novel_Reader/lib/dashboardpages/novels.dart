import 'package:flutter/material.dart';
import 'package:project_4/dashboardpages/more_book_screen.dart';
import 'package:project_4/dashboardpages/novel_slider.dart';

class Novels_ extends StatefulWidget {
  @override
  State<Novels_> createState() => _Novels_State();
}

class _Novels_State extends State<Novels_> {
  var novel = [
    'assets/images/Blue Black White Modern Concept Story About You And Me Book Cover.png',
    'assets/images/Blue and Cream Simple Old Castle Mystery Book Cover.png',
    'assets/images/Brown Mystery Novel Book Cover.png',
    'assets/images/Elegant Dark Woods Fantasy Photo Book Cover.png',
    'assets/images/Purple Cute Cartoon Fairy Winter Stories Book Cover.png',
    'assets/images/phpThumb_generated_thumbnail.png',
  ];

  var novel2 = [
    'assets/images/Festive Illustration Christmas Market Book Cover.png',
    'assets/images/White Black Abstract Dark Modern Photo The Flawless Beauty Book Cover.png',
    'assets/images/White Black Abstract Dark Modern Photo The Flawless Beauty Book Cover-2.png',
    'assets/images/Yellow Fantasy Novel Book Cover.png',
    'assets/images/Yellow Fantasy Novel Book Cover-2.png',
    'assets/images/Elegant Girl Photo Romance Book Cover.png'
  ];

  var nText = [
    'Story About You And me',
    'Old Castle Mystery',
    'Roman',
    'Walk Into The Shadow',
    'Winter Stories',
    "I Don't Love You Anymore"
  ];

  var nText2 = [
    'Festive Hearts',
    'The Flawless Beauty',
    'Magic World From The Sky',
    'Sword',
    'Breaking',
    'Waiting Or You',
  ];

  var author = [
    'Darshan Raval',
    'Armaan Malik',
    'Neil Bhatt',
    'Parth Samthaan',
    'Dhruwal Patel',
    'Rithvik Singh'
  ];

  var author2 = [
    'Raahi Kapoor',
    'Misha Verma',
    'Anisha Sharma',
    'Dishi Kumar',
    'Devesh Parker',
    'Kabir kapoor',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Expanded(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: NovelSlider(),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap:(){
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (contex) => ContinueReading()));
                        },
                      child: Text(
                        'Continue Reading',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 19,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 197,
                    ),
                    InkWell(
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (contex) => ContinueReading()));
                      },
                      child: Text('MORE',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                              color: Colors.blueGrey.shade700)),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(children: [
                  for (int index = 0; index < novel.length; index++)
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 10, bottom: 2),
                            height: 200,
                            width: 130,
                            child: Image.asset(
                              novel[index],
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            width: 130,
                            child: Text(
                              nText[index],
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                          ),
                          SizedBox(
                            width: 130,
                            child: Text(
                              author[index],
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w400),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                ]),
              ),
              Divider(
                thickness: 7,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap:(){
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (contex) => TopNewNovels()));
                      },
                      child: Text(
                        'Top New Novels',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 19,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 212,
                    ),
                    InkWell(
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (contex) => TopNewNovels()));
                      },
                      child: Text('MORE',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                              color:  Colors.blueGrey.shade700)),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(children: [
                  for (int index = 0; index < novel2.length; index++)
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 10, bottom: 2),
                            height: 200,
                            width: 130,
                            child: Image.asset(
                              novel2[index],
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                              width: 130,
                              child: Text(
                                nText2[index],
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              )),
                          SizedBox(
                              width: 130,
                              child: Text(
                                author2[index],
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w400),
                              )),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                ]),
              ),
              Divider(
                thickness: 7,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap:(){
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (contex) => NewOriginals()));
                      },
                      child: Text(
                        'New Originals',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 19,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 230,
                    ),
                    InkWell(
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (contex) => NewOriginals()));
                      },
                      child: Text('MORE',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                              color:  Colors.blueGrey.shade700)),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(children: [
                  for (int index = 0; index < novel.length; index++)
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 10, bottom: 2),
                            height: 200,
                            width: 130,
                            child: Image.asset(
                              novel[index],
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                              width: 130,
                              child: Text(
                                nText[index],
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              )),
                          SizedBox(
                              width: 130,
                              child: Text(
                                author[index],
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w400),
                              )),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                ]),
              ),
              Divider(
                thickness: 7,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap:(){
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (contex) => Romance()));
                      },
                      child: Text(
                        'Romance',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 19,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 270,
                    ),
                    InkWell(
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (contex) => Romance()));
                      },
                      child: Text('MORE',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                              color:  Colors.blueGrey.shade700)),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(children: [
                  for (int index = 0; index < novel2.length; index++)
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 10, bottom: 2),
                            height: 200,
                            width: 130,
                            child: Image.asset(
                              novel2[index],
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                              width: 130,
                              child: Text(
                                nText2[index],
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              )),
                          SizedBox(
                              width: 130,
                              child: Text(
                                author2[index],
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w400),
                              )),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                ]),
              ),
              Divider(
                thickness: 7,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap:(){
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (contex) => Drama()));
                      },
                      child: Text(
                        'Drama',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 19,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 295,
                    ),
                    InkWell(
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (contex) => Drama()));
                      },
                      child: Text('MORE',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                              color:  Colors.blueGrey.shade700)),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(children: [
                  for (int index = 0; index < novel.length; index++)
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 10, bottom: 2),
                            height: 200,
                            width: 130,
                            child: Image.asset(
                              novel[index],
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                              width: 130,
                              child: Text(
                                nText[index],
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              )),
                          SizedBox(
                              width: 130,
                              child: Text(
                                author[index],
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w400),
                              )),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                ]),
              ),
              Divider(
                thickness: 7,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap:(){
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (contex) => Drama()));
                      },
                      child: Text(
                        'Fantasy',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 19,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 284,
                    ),
                    InkWell(
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (contex) => Drama()));
                      },
                      child: Text('MORE',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                              color:  Colors.blueGrey.shade700)),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(children: [
                  for (int index = 0; index < novel2.length; index++)
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 10, bottom: 2),
                            height: 200,
                            width: 130,
                            child: Image.asset(
                              novel2[index],
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                              width: 130,
                              child: Text(
                                nText2[index],
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              )),
                          SizedBox(
                              width: 130,
                              child: Text(
                                author2[index],
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w400),
                              )),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                ]),
              ),
              Divider(
                thickness: 7,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap:(){
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (contex) => SuspenseThriller()));
                        },
                      child: Text(
                        'Suspense Thriller',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 19,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 199,
                    ),
                    InkWell(
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (contex) => SuspenseThriller()));
                      },
                      child: Text('MORE',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                              color:  Colors.blueGrey.shade700)),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(children: [
                  for (int index = 0; index < novel.length; index++)
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 10, bottom: 2),
                            height: 200,
                            width: 130,
                            child: Image.asset(
                              novel[index],
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                              width: 130,
                              child: Text(
                                nText[index],
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              )),
                          SizedBox(
                              width: 130,
                              child: Text(
                                author[index],
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w400),
                              )),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                ]),
              ),
              Divider(
                thickness: 7,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap:(){
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (contex) => Mythology()));
                      },
                      child: Text(
                        'Mythology',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 19,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 260,
                    ),
                    InkWell(
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (contex) => Mythology()));
                      },
                      child: Text('MORE',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                              color:  Colors.blueGrey.shade700)),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(children: [
                  for (int index = 0; index < novel.length; index++)
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 10, bottom: 2),
                            height: 200,
                            width: 130,
                            child: Image.asset(
                              novel2[index],
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                              width: 130,
                              child: Text(
                                nText2[index],
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              )),
                          SizedBox(
                              width: 130,
                              child: Text(
                                author2[index],
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w400),
                              )),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                ]),
              ),
              Divider(
                thickness: 6,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap:(){
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (contex) => Historical()));
                      },
                      child: Text(
                        'Historical',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 19,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 268,
                    ),
                    InkWell(
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (contex) => Historical()));
                      },
                      child: Text('MORE',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                              color:  Colors.blueGrey.shade700)),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(children: [
                  for (int index = 0; index < novel.length; index++)
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 10, bottom: 2),
                            height: 200,
                            width: 130,
                            child: Image.asset(
                              novel[index],
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                              width: 130,
                              child: Text(
                                nText[index],
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              )),
                          SizedBox(
                              width: 130,
                              child: Text(
                                author[index],
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w400),
                              )),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );

// Column(
//   children: [

//     Padding(
//       padding: const EdgeInsets.only(right: 10,left: 10,top: 10),
//       child: Row(
//         children: [
//           Container(
//             height: 250,
//             width: 130,
//             child: Column(
//               children: [
//                 Image.asset(   'assets/images/phpThumb_generated_thumbnail.png'
//                   ,height: 200,width: 130,),
//                 Text("I Don't Love Y... ",style: TextStyle(fontSize: 17),),
//                 Text('Rithvik Singh',style: TextStyle(fontSize: 15),)
//               ],
//             ),
//           ),
//         ],
//       ),
//     ),
//     Divider(
//       height: 10,
//       thickness: 4,
//     ),
// Column(
    //     children:[
    //       Padding(
    //         padding: const EdgeInsets.all(8.0),
    //         child: Row(
    //           mainAxisAlignment: MainAxisAlignment.start,
    //           children: [

    //             ),
    //           ],
    //         ),
    //       ),
//           Padding(
//             padding: const EdgeInsets.only(right: 10,left: 10,top: 10),
//             child: Row(
//               children: [
//                 Container(
//                   height: 250,
//                   width: 130,
//                   child: Column(
//                     children: [
//                       Image.asset(   'assets/images/phpThumb_generated_thumbnail.png'
//                         ,height: 200,width: 130,),
//                       Text("I Don't Love You ",style: TextStyle(fontSize: 17),),
//                       Text('Rithvik Singh',style: TextStyle(fontSize: 15),)
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//
//     Wrap(
//         alignment: WrapAlignment.spaceEvenly,
//         runSpacing: 8,
//         children: [
//           Container(
//             height: 200,
//             width: 130,
//             child: Image.asset(novel[4],fit: BoxFit.cover,),
//           ),
//           Image.asset(
//             'assets/images/1003w-DqHX0DWBxm8.webp',
//             height: 200,
//             width: 130,
//           ),
//           Image.asset(
//             'assets/images/1003w-oz6qZczlPAY.webp',
//             height: 200,
//             width: 130,
//           ),
//           Divider(
//             height: 10,
//             thickness: 5,
//           ),
//           Image.asset(
//             'assets/images/Blue Black White Modern Concept Story About You And Me Book Cover.png',
//             height: 200,
//             width: 130,
//           ),
//           Image.asset(
//             'assets/images/Blue White Simple Mountain and Cloud Landscape Photo Book Cover.png',
//             height: 200,
//             width: 130,
//           ),
//           Image.asset(
//             'assets/images/Brown Mystery Novel Book Cover.png',
//             height: 200,
//             width: 130,
//           ),
//           Image.asset(
//             'assets/images/Brown Rusty Mystery Novel Book Cover.png',
//             height: 200,
//             width: 130,
//           ),
//           Image.asset(
//             'assets/images/Elegant Dark Woods Fantasy Photo Book Cover.png',
//             height: 200,
//             width: 130,
//           ),
//           Image.asset(
//             'assets/images/Elegant Girl Photo Romance Book Cover.png',
//             height: 200,
//             width: 130,
//           ),
//           Image.asset(
//             'assets/images/Festive Illustration Christmas Market Book Cover.png',
//             height: 200,
//             width: 130,
//           ),
//           Image.asset(
//             'assets/images/Purple And Green Romance Novel Book Cover.png',
//             height: 200,
//             width: 130,
//           ),
//           Image.asset(
//             'assets/images/Purple Cute Cartoon Fairy Winter Stories Book Cover.png',
//             height: 200,
//             width: 130,
//           ),
//           Image.asset(
//             'assets/images/White Black Abstract Dark Modern Photo The Flawless Beauty Book Cover.png',
//             height: 200,
//             width: 130,
//           ),
//           Image.asset(
//             'assets/images/White Black Abstract Dark Modern Photo The Flawless Beauty Book Cover-2.png',
//             height: 200,
//             width: 130,
//           ),
//           Image.asset(
//             'assets/images/Yellow Fantasy Novel Book Cover.png',
//             height: 200,
//             width: 130,
//           ),
//           Image.asset(
//             'assets/images/Yellow Fantasy Novel Book Cover-2.png',
//             height: 200,
//             width: 130,
//           ),
//         ])
//        ]);
  }
}

// ListView.builder(
//   itemBuilder: (context, index) {
//     return Column(
//       children: [
//         Container(
//             margin: EdgeInsets.only(
//                 top: 10, right: 8, left: 8, bottom: 10),
//             height: 200,
//             width: 130,
//             child: Image.asset(
//               novel[index],
//               fit: BoxFit.cover,
//             )),
//       ],
//     );
//   },
//   itemCount: novel.length,
//   scrollDirection: Axis.horizontal,
// ),
