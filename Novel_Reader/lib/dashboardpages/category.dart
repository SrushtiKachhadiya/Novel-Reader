import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:project_4/dashboardpages/all_novels_screen.dart';
import 'package:project_4/models/category_Model.dart';
import 'package:http/http.dart' as http;

class Category_ extends StatefulWidget {
  @override
  State<Category_> createState() => _Category_State();
}

class _Category_State extends State<Category_>
    with SingleTickerProviderStateMixin {
  List<CategoryModel> category = [];

  Future<List<CategoryModel>> fetchData() async {
    final response =
        await http.get(Uri.parse("https://jbinfosoft.com/FLT/history.json"));
    // var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString()) as List<dynamic>;
      List<CategoryModel> categories = [];
      for (var item in data) {
        categories.add(CategoryModel.fromJson(item));
      }
      return categories;
    } else {
      print(response);
      return category;
    }
  }

  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 8, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  // List<String> categories = ['For You','New',  'Romance','Drama','Fantasy','SuspenseThriller', 'Mythology', 'Historical '];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<CategoryModel>>(
        future: fetchData(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
                child: CircularProgressIndicator(
              color: Theme.of(context).colorScheme.primary,
            ));
          } else {
            // _tabController = TabController(length: snapshot.data!.length, vsync: this);
            return DefaultTabController(
              length: snapshot.data!.length,
              child: Scaffold(
                body: Column(
                  children: [
                    TabBar(
                      tabs: snapshot.data!
                          .map((category) => Tab(
                                child: Text(
                                  category.categoryName,
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ))
                          .toList(),
                      isScrollable: true,
                      indicatorColor: Theme.of(context).colorScheme.primary,
                      unselectedLabelColor: Colors.blueGrey.shade700,
                      labelColor: Theme.of(context).colorScheme.primary,
                      tabAlignment: TabAlignment.start,
                      dividerHeight: 1,
                      dividerColor: Colors.grey.shade400,
                      controller: _tabController,
                    ),
                    Expanded(
                      child: TabBarView(
                        children: List<Widget>.generate(snapshot.data!.length, (index) {
                          return AllNovelsScreen(snapshot.data![index]
                              .data); // Replace NewScreen() with your widget for each item
                        }),
                        controller: _tabController,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

//Tab(
//                   child: Text(
//                     'For You',
//                     style: TextStyle(
//                       fontSize: 17,
//                       fontWeight: FontWeight.w700,
//                     ),
//                   ),
//                 ),
//                 Tab(
//                   child: Text(
//                     'New',
//                     style: TextStyle(
//                       fontSize: 17,
//                       fontWeight: FontWeight.w700,
//                     ),
//                   ),
//                 ),
//                 Tab(
//                   child: Text(
//                     'Romance',
//                     style: TextStyle(
//                       fontSize: 17,
//                       fontWeight: FontWeight.w700,
//                     ),
//                   ),
//                 ),
//                 Tab(
//                   child: Text(
//                     'Drama',
//                     style: TextStyle(
//                       fontSize: 17,
//                       fontWeight: FontWeight.w700,
//                     ),
//                   ),
//                 ),
//                 Tab(
//                   child: Text(
//                     'Fantasy',
//                     style: TextStyle(
//                       fontSize: 17,
//                       fontWeight: FontWeight.w700,
//                     ),
//                   ),
//                 ),
//                 Tab(
//                   child: Text(
//                     'SuspenseThriller',
//                     style: TextStyle(
//                       fontSize: 17,
//                       fontWeight: FontWeight.w700,
//                     ),
//                   ),
//                 ),
//                 Tab(
//                   child: Text(
//                     'Mythology',
//                     style: TextStyle(
//                       fontSize: 17,
//                       fontWeight: FontWeight.w700,
//                     ),
//                   ),
//                 ),
//                 Tab(
//                   child: Text(
//                     'Historical ',
//                     style: TextStyle(
//                       fontSize: 17,
//                       fontWeight: FontWeight.w700,
//                     ),
//                   ),
//                 ),
