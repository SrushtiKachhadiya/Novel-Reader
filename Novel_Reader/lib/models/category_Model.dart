// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

class CategoryModel {
  String categoryName;
  List<Datum> data;

  CategoryModel({
    required this.categoryName,
    required this.data,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
    categoryName: json["category_name"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "category_name": categoryName,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  String label;
  List<Novel> novel;

  Datum({
    required this.label,
    required this.novel,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    label: json["label"],
    novel: List<Novel>.from(json["novel"].map((x) => Novel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "label": label,
    "novel": List<dynamic>.from(novel.map((x) => x.toJson())),
  };
}

// enum Label {
//   MORE_NOVELS,
//   NEW_ARRIVALS,
//   POPULAR_NOVELS,
//   TRENDING_NOVELS,
//   UPCOMING_NOVELS
// }
//
// final labelValues = EnumValues({
//   "More Novels": Label.MORE_NOVELS,
//   "New Arrivals": Label.NEW_ARRIVALS,
//   "Popular Novels": Label.POPULAR_NOVELS,
//   "Trending Novels": Label.TRENDING_NOVELS,
//   "Upcoming Novels": Label.UPCOMING_NOVELS
// });

class Novel {
  String author;
  String imageLink;
  String language;
  String title;
  String? bNPrice;
  String? snapdealPrice;
  String? flipkartPrice;
  String amazonPrice;
  String? bN;
  String? snapdeal;
  String? flipkart;
  String amazon;
  String description;

  Novel({
    required this.author,
    required this.imageLink,
    required this.language,
    required this.title,
    this.bNPrice,
    this.snapdealPrice,
    this.flipkartPrice,
    required this.amazonPrice,
    this.bN,
    this.snapdeal,
    this.flipkart,
    required this.amazon,
    required this.description,
  });

  factory Novel.fromJson(Map<String, dynamic> json) => Novel(
    author: json["author"],
    imageLink: json["imageLink"],
    language: json["language"],
    title: json["title"],
    bNPrice: json["b&nPrice"],
    snapdealPrice: json["snapdealPrice"],
    flipkartPrice: json["flipkartPrice"],
    amazonPrice: json["amazonPrice"],
    bN: json["b&n"],
    snapdeal: json["snapdeal"],
    flipkart: json["flipkart"],
    amazon: json["amazon"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "author": author,
    "imageLink": imageLink,
    "language": language,
    "title": title,
    "b&nPrice": bNPrice,
    "snapdealPrice": snapdealPrice,
    "flipkartPrice": flipkartPrice,
    "amazonPrice": amazonPrice,
    "b&n": bN,
    "snapdeal": snapdeal,
    "flipkart": flipkart,
    "amazon": amazon,
    "description": description,
  };
}

// enum Language {
//   ENGLISH,
//   ENGLISH_HINDI
// }

// final languageValues = EnumValues({
//   "English": Language.ENGLISH,
//   "English, Hindi": Language.ENGLISH_HINDI
// });

// class EnumValues<T> {
//   Map<String, T> map;
//   late Map<T, String> reverseMap;
//
//   EnumValues(this.map);
//
//   Map<T, String> get reverse {
//     reverseMap = map.map((k, v) => MapEntry(v, k));
//     return reverseMap;
//   }
// }

// class CategoryModel {
//   String categoryName;
//   List<Datum> data;
//
//   CategoryModel({
//     required this.categoryName,
//     required this.data,
//   });
//
//   factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
//     categoryName: json["category_name"],
//     data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "category_name": categoryName,
//     "data": List<dynamic>.from(data.map((x) => x.toJson())),
//   };
// }
//
// class Datum {
//   String label;
//   List<Novel> novel;
//
//   Datum({
//     required this.label,
//     required this.novel,
//   });
//
//   factory Datum.fromJson(Map<String, dynamic> json) => Datum(
//     label: json["label"],
//     novel: List<Novel>.from(json["novel"].map((x) => Novel.fromJson(x))),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "label": label,
//     "novel": List<dynamic>.from(novel.map((x) => x.toJson())),
//   };
// }
//
// // enum Label {
// //   MORE_NOVELS,
// //   NEW_ARRIVALS,
// //   POPULAR_NOVELS,
// //   TRENDING_NOVELS,
// //   UPCOMING_NOVELS
// // }
//
// // final labelValues = EnumValues({
// //   "More Novels": Label.MORE_NOVELS,
// //   "New Arrivals": Label.NEW_ARRIVALS,
// //   "Popular Novels": Label.POPULAR_NOVELS,
// //   "Trending Novels": Label.TRENDING_NOVELS,
// //   "Upcoming Novels": Label.UPCOMING_NOVELS
// // });
//
// class Novel {
//   String author;
//   String imageLink;
//   String language;
//   String title;
//   String? bN;
//   String? snapdeal;
//   String? flipkart;
//   String amazon;
//   String description;
//
//   Novel({
//     required this.author,
//     required this.imageLink,
//     required this.language,
//     required this.title,
//     this.bN,
//     this.snapdeal,
//     this.flipkart,
//     required this.amazon,
//     required this.description,
//   });
//
//   factory Novel.fromJson(Map<String, dynamic> json) => Novel(
//     author: json["author"],
//     imageLink: json["imageLink"],
//     language:json["language"],
//     title: json["title"],
//     bN: json["b&n"],
//     snapdeal: json["snapdeal"],
//     flipkart: json["flipkart"],
//     amazon: json["amazon"],
//     description: json["description"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "author": author,
//     "imageLink": imageLink,
//     "language": language,
//     "title": title,
//     "b&n": bN,
//     "snapdeal": snapdeal,
//     "flipkart": flipkart,
//     "amazon": amazon,
//     "description": description,
//   };
// }

// enum Language {
//   ENGLISH,
//   ENGLISH_HINDI
// }
//
// final languageValues = EnumValues({
//   "English": Language.ENGLISH,
//   "English, Hindi": Language.ENGLISH_HINDI
// });
//
// class EnumValues<T> {
//   Map<String, T> map;
//   late Map<T, String> reverseMap;
//
//   EnumValues(this.map);
//
//   Map<T, String> get reverse {
//     reverseMap = map.map((k, v) => MapEntry(v, k));
//     return reverseMap;
//   }
//}






// class CategoryModel {
//   String categoryName;
//   List<Datum> data;
//
//   CategoryModel({
//     required this.categoryName,
//     required this.data,
//   });
//
//   factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
//     categoryName: json["category_name"],
//     data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "category_name": categoryName,
//     "data": List<dynamic>.from(data.map((x) => x.toJson())),
//   };
// }
//
// class Datum {
//   String? more;
//   String? label;
//   List<Novel> novel;
//
//   Datum({
//     this.more,
//     required this.label,
//     required this.novel,
//   });
//
//   factory Datum.fromJson(Map<String, dynamic> json) => Datum(
//     more: json["more"],
//     label: json["label"],
//     novel: List<Novel>.from(json["novel"].map((x) => Novel.fromJson(x))),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "more": more,
//     "label": label,
//     "novel": List<dynamic>.from(novel.map((x) => x.toJson())),
//   };
// }
//
// // enum Label {
// //   MORE_NOVELS,
// //   NEW_ARRIVALS,
// //   POPULAR_NOVELS,
// //   TRENDING_NOVELS,
// //   UPCOMING_NOVELS
// // }
// //
// // final labelValues = EnumValues({
// //   "More Novels": Label.MORE_NOVELS,
// //   "New Arrivals": Label.NEW_ARRIVALS,
// //   "Popular Novels": Label.POPULAR_NOVELS,
// //   "Trending Novels": Label.TRENDING_NOVELS,
// //   "Upcoming Novels": Label.UPCOMING_NOVELS
// // });
//
// class Novel {
//   String author;
//   String imageLink;
//   String language;
//   String title;
//   String? flipkart;
//   String amazon;
//   String description;
//
//   Novel({
//     required this.author,
//     required this.imageLink,
//     required this.language,
//     required this.title,
//     this.flipkart,
//     required this.amazon,
//     required this.description,
//   });
//
//   factory Novel.fromJson(Map<String, dynamic> json) => Novel(
//     author: json["author"],
//     imageLink: json["imageLink"],
//     language: json["language"],
//     title: json["title"],
//     flipkart: json["flipkart"],
//     amazon: json["amazon"],
//     description: json["description"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "author": author,
//     "imageLink": imageLink,
//     "language": language,
//     "title": title,
//     "flipkart": flipkart,
//     "amazon": amazon,
//     "description": description,
//   };
// }
//
//
//
// // class EnumValues<T> {
// //   Map<String, T> map;
// //   late Map<T, String> reverseMap;
// //
// //   EnumValues(this.map);
// //
// //   Map<T, String> get reverse {
// //     reverseMap = map.map((k, v) => MapEntry(v, k));
// //     return reverseMap;
// //   }
// // }
