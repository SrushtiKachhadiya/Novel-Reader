import 'package:flutter/material.dart';
import 'package:project_4/dashboardpages/book_detail_screen.dart';
import 'package:project_4/dashboardpages/all_novels_screen.dart';
import 'package:project_4/dashboardpages/searchbarpage.dart';
import 'package:project_4/firebase/firebase_options.dart';
import 'package:project_4/profilepages/aboutus_screen.dart';
import 'package:project_4/dashboardpages/category.dart';
import 'package:project_4/profilepages/edit_profile.dart';
import 'package:project_4/navigationbarpages/favorite_screen.dart';
import 'package:project_4/navigationbarpages/navigation_menu.dart';
import 'package:project_4/dashboardpages/novel_slider.dart';
import 'package:project_4/dashboardpages/novels.dart';
import 'package:project_4/profilepages/privacy_policy_screen.dart';
import 'package:project_4/navigationbarpages/profile_screen.dart';
import 'package:project_4/dashboardpages/searchbar.dart';
import 'package:project_4/provider/favouritebook_provider.dart';
import 'package:project_4/provider/librarybook_provider.dart';
import 'package:project_4/splash_screen.dart';
import 'package:project_4/profilepages/terms_condition_screen.dart';
import 'package:project_4/userpages/user_create_screen.dart';
import 'package:project_4/userpages/user_forgetpass.dart';
import 'package:project_4/userpages/user_login_screen.dart';
import 'profilepages/change_password.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(NovelReader());
}

class NovelReader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
       ChangeNotifierProvider(create: (_)=>FavoriteBookProvider()),
       ChangeNotifierProvider(create: (_)=>LibraryBookProvider()),
    ],
    child: MaterialApp(
        title: 'NovelReader',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            dividerColor: Colors.blue,
            primarySwatch: Colors.blueGrey,
            colorScheme: ColorScheme.light(
              primary: Colors.blueGrey.shade900,
              // onPrimary: Colors.blueGrey.shade700,
            ),
            textSelectionTheme: TextSelectionThemeData(
                cursorColor: Colors.blueGrey.shade900,
                selectionColor: Colors.blueGrey.shade200,
                selectionHandleColor: Colors.blueGrey.shade900),
            datePickerTheme: DatePickerThemeData(
              backgroundColor: Colors.blueGrey.shade100,
              inputDecorationTheme: InputDecorationTheme(
                  labelStyle: TextStyle(color: Colors.blueGrey.shade900,),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blueGrey.shade900,
                      width: 2,
                    ),
                  )),
              cancelButtonStyle: ButtonStyle(
                  foregroundColor:
                  MaterialStateProperty.all(Colors.blueGrey.shade900,),
                  overlayColor:
                  MaterialStateProperty.all(Colors.blueGrey.shade200)),
              confirmButtonStyle: ButtonStyle(
                  foregroundColor:
                  MaterialStateProperty.all(Colors.blueGrey.shade900),
                  overlayColor:
                  MaterialStateProperty.all(Colors.blueGrey.shade200)),
            ),
            dividerTheme: DividerThemeData(color: Colors.grey.shade400)
        ),
        home: SplashScreen()),);
  }
}

class DashBoardScreen extends StatefulWidget {
  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: Text(
            'Novel Reader',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Column(
            children: [
            SearchBar_(),
              Expanded(child: Category_()),
             // Expanded(child: Novels_())
            // Expanded(
             //   child: SingleChildScrollView(
           //     scrollDirection: Axis.vertical,
           //     child: Novels_(),
           //     physics: ClampingScrollPhysics(),
           //   ),
               // ),
             ],

             ),
                 );
  }
}
