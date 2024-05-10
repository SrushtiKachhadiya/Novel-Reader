import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project_4/dashboardpages/searchbarpage.dart';

class SearchBar_ extends StatefulWidget {
  @override
  State<SearchBar_> createState() => _SearchBar_State();
}

class _SearchBar_State extends State<SearchBar_> {

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.only(top: 8.0,right: 8,left: 8),
      child: InkWell(
        onTap:(){

          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (contex) => SearchbarPage()));
        },
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width*0.95,
              height: 40,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.search,color: Colors.white54,),
                  ),
                  Text('Search for Novels and Authors........',style: TextStyle(color: Colors.white54),),
                  Icon(Icons.keyboard_voice,color: Colors.white54,),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
