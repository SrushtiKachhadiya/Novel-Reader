import 'dart:async';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project_4/navigationbarpages/navigation_menu.dart';
import 'package:project_4/userpages/user_login_screen.dart';
import 'package:project_4/utils/constant.dart';
import 'package:project_4/utils/shared_pref_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget{
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {

    Timer(Duration(seconds: 3),() {

      callPrefrence();

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>isLoggedIn ? NavigationMenu() : UserRegisterScreen()));
    });

    super.initState();
  }


  late SharedPreferences shared;
  bool isLoggedIn = true;

  Future<bool> callPrefrence() async {
    shared = await SharedPreferences.getInstance();
    isLoggedIn =
        SharedPreferencesHelper.getBoolean(SharedPrefKeys.isLoggedIn, shared)!;
    return isLoggedIn;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.blueGrey.shade900,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FaIcon(FontAwesomeIcons.bookOpen,color: Colors.white,size: 100,),
              SizedBox(height: 9,),
              Text('NovelReader',style: TextStyle(fontSize: 28,fontWeight: FontWeight.w600,color: Colors.white),)
            ],
          ),
        ),
      ),
    );
  }
}