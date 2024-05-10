import 'dart:math';
import 'package:flutter/material.dart';
import 'package:project_4/dashboardpages/book_detail_screen.dart';
import 'package:project_4/models/category_Model.dart';

class MoreBookScreen extends StatefulWidget {
  List<Novel> novel = [];

  var label;

  MoreBookScreen(this.novel, this.label);

  @override
  State<MoreBookScreen> createState() => _FantasyState();
}

class _FantasyState extends State<MoreBookScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.label,
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: ListView.builder(
          itemCount: (widget.novel.length / 3).ceil(),
          itemBuilder: (context, rowIndex) {
            return Row(
              children: [
                for (int i = rowIndex * 3; i < min(widget.novel.length, (rowIndex + 1) * 3); i++)
                Padding(
                 padding: EdgeInsets.symmetric(horizontal: 3.0),
                 child: InkWell(
                   onTap: (){
                     Navigator.push(
                         context,
                         MaterialPageRoute(
                             builder: (contex) =>
                             // Drama()));
                             BookDetailScreen(
                                 widget
                                     .novel[i]
                                     .description.toString(),
                                 widget
                                     .novel[i]
                                     .title.toString(),
                                 widget
                                     .novel[i]
                                     .imageLink.toString(),
                                 widget
                                     .novel[i]
                                     .author.toString(),
                                 widget
                                     .novel[i]
                                     .language.toString(),
                                 widget
                                     .novel[i]
                                     .amazon.toString(),
                                 widget
                                     .novel[i]
                                     .flipkart.toString(),
                                 widget.novel[i].bN.toString(),
                                 widget.novel[i].snapdeal.toString(),
                                 widget.novel[i].amazonPrice.toString(),
                                 widget.novel[i].flipkartPrice.toString(),
                                 double.tryParse(widget.novel[i].bNPrice.toString()),
                                 widget.novel[i].snapdealPrice.toString(),
                                 widget.novel[i].hashCode,widget.novel[i]
                                 )));
                   },
                   child: Container(
                     width: MediaQuery.of(context).size.width*0.3,
                     child: Column(
                       children: [
                         Container(
                           margin: EdgeInsets.only(top: 10, bottom: 2),
                           height: 200,
                           child: Image.network(
                             widget.novel[i].imageLink.toString(),
                             fit: BoxFit.cover,
                           ),
                         ),
                         SizedBox(
                           child: Text(
                             widget.novel[i].title.toString(),
                             overflow: TextOverflow.ellipsis,
                             style: TextStyle(
                                 fontSize: 16, fontWeight: FontWeight.w500),
                           ),
                         ),
                         SizedBox(
                           child: Text(
                             widget.novel[i].author.toString(),
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
                 ),
                ),
              ],
            );
          }),
    );
  }
}
