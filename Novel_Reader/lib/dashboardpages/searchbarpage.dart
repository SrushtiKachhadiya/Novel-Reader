import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:project_4/dashboardpages/more_book_screen.dart';
import 'package:project_4/models/category_Model.dart';
import 'package:project_4/navigationbarpages/navigation_menu.dart';

class SearchbarPage extends StatefulWidget {
  @override
  State<SearchbarPage> createState() => _SearchbarPageState();
}

class _SearchbarPageState extends State<SearchbarPage> {
  @override
  var searchText = TextEditingController();

  List<CategoryModel> searchResults = [];
  List<CategoryModel> search = [];

  void fetchSearchResults(String query) async {
    final url = Uri.parse(
        "https://jbinfosoft.com/FLT/history.json"); // Replace with your API endpoint
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        setState(() {
          // Parse JSON response and update searchResults
          Iterable list = jsonDecode(response.body);
          searchResults =
              list.map((model) => CategoryModel.fromJson(model)).toList();
        });
      } else {
        throw Exception('Failed to load search results');
      }
    } catch (e) {
      print('Error fetching search results: $e');
    }
  }

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
      return search;
    }
  }

  @override
  Widget build(BuildContext context) {
    print(searchResults.length);
    print(fetchData);
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 30,
        leading: InkWell(
          onTap: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (contex) => NavigationMenu()));
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 20,
          ),
        ),
        titleSpacing: 10,
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: SearchBar(
          onChanged: (value) {
            if (value.isNotEmpty) {
              fetchSearchResults(value);
            } else {
              setState(() {
                searchResults.clear();
              });
            }
          },
          constraints: BoxConstraints(maxHeight: 100),
          controller: searchText,
          textStyle: MaterialStateProperty.all(
              TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
          backgroundColor: MaterialStateProperty.all(Colors.blueGrey.shade700),
          shape: MaterialStateProperty.all(ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(11))),
          leading: Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8),
            child: Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
          hintText: 'Search for Novels and Authors.....',
          hintStyle:
              MaterialStateProperty.all(TextStyle(color: Colors.white60)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Expanded(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width*0.95,
                child: Text(
                  'Browse all',
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
              ),
              FutureBuilder<List<CategoryModel>>(
                  future: fetchData(),
                  builder: (context, snapshot) {
                    return Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount:
                            snapshot.data != null ? snapshot.data!.length : 0,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {

                              List<Novel> listNovel = [];

                              for(var newData in snapshot.data![index].data) {

                                listNovel.addAll(newData.novel);

                              }

                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (contex) => MoreBookScreen(
                                          listNovel,
                                        snapshot.data![index].categoryName,
                                      )));
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 5.0),
                              child: Card(
                                color: Colors.grey.shade100,
                                elevation: 6,
                                child: ListTile(
                                  leading: Icon(
                                    Icons.menu_book,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  title: Text(
                                    snapshot.data![index].categoryName,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ),
                                  trailing: Icon(
                                    Icons.arrow_forward,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
