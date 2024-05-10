import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_4/profilepages/aboutus_screen.dart';
import 'package:project_4/profilepages/change_password.dart';
import 'package:project_4/profilepages/edit_profile.dart';
import 'package:project_4/profilepages/privacy_policy_screen.dart';
import 'package:project_4/profilepages/terms_condition_screen.dart';
import 'package:project_4/userpages/user_login_screen.dart';
import 'package:project_4/utils/shared_pref_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/constant.dart';

class ProfileScreen extends StatefulWidget {
  var email;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int index = 0;

  late SharedPreferences shared;

  var ficon = [
    Icons.edit,
    Icons.key,
    Icons.file_copy_sharp,
    Icons.shield_moon,
    Icons.person_outline
  ];

  var title = [
    'Edit Profile',
    'Change Password',
    'Terms & Condition',
    'Privacy & Policy',
    'About Us'
  ];

  var token = "";

  Future<String> callPrefrence() async {
    shared = await SharedPreferences.getInstance();
    token = SharedPreferencesHelper.getString(SharedPrefKeys.token, shared)!;

    return token;
  }

  @override
  Widget build(BuildContext context) {
    print(widget.email);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          'Profile',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            setupBuilder(),
            SizedBox(
              height: 30,
            ),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(right: 10, left: 10),
                    child: InkWell(
                      onTap: () {
                        if (index == 0) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (contex) =>
                                  EditProfileScreen(widget.email),
                            ),
                          );
                        } else if (index == 1) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (contex) => ChangePasswordScreen(),
                            ),
                          );
                        } else if (index == 2) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (contex) => TermsConditionScreen(),
                            ),
                          );
                        } else if (index == 3) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (contex) => PrivacyPolicyScreen(),
                            ),
                          );
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (contex) => AboutUsScreen(),
                            ),
                          );
                        }
                      },
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                          child: Icon(
                            ficon[index],
                            color: Colors.white,
                          ),
                        ),
                        title: Text(
                          title[index],
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                    ),
                  );
                },
                itemCount: ficon.length,
                separatorBuilder: (context, index) {
                  return Divider(
                    height: 10,
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 80),
              child: SizedBox(
                height: 55,
                width: 300,
                child: ElevatedButton(
                  onPressed: () async {
                    shared = await SharedPreferences.getInstance();
                    await FirebaseAuth.instance.signOut();
                    SharedPreferencesHelper.saveBoolean(
                        SharedPrefKeys.isLoggedIn, false, shared);
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (contex) => UserRegisterScreen()));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.logout,
                        color: Colors.blueGrey.shade100,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        'Log Out',
                        style: TextStyle(
                            color: Colors.blueGrey.shade100, fontSize: 20),
                      ),
                    ],
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget setupBuilder() {
    return FutureBuilder<String>(
        future: callPrefrence(),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator(); // Placeholder while loading
          } else {
            return updateFavouriteBuilder(snapshot.data.toString());
          }
        });
  }

  Widget updateFavouriteBuilder(String string) {
    CollectionReference library =
        FirebaseFirestore.instance.collection('Users');

    return FutureBuilder<DocumentSnapshot>(
      future: library.doc(token).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(); // Placeholder while loading
        } else if (snapshot.hasData && snapshot.data!.exists) {

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 15),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 6,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(width: 8, color: Colors.white),
                    ),
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: snapshot.data!.toString().contains("image")
                              ? MemoryImage(base64Decode(snapshot.data!["image"].toString()))
                              : AssetImage("assets/images/profile-icon-9.png") as ImageProvider<Object>,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Text(
                snapshot.data!["Username"],
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
              ),
            ],
          );
        } else {
          return Text("data");
        }
      },
    );
  }
}
