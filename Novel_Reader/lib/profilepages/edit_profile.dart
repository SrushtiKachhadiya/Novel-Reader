import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_4/utils/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/shared_pref_helper.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
  var emailAddress;

  EditProfileScreen(this.emailAddress);
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();

  var fName = '';
  var lName = '';
  var email = '';
  var dob = '';
  var gender = '';

  var fNameText = TextEditingController();
  var lNameText = TextEditingController();
  var emailText = TextEditingController();
  var dobText = TextEditingController();

  int _value = 0;
  File? _image;

  void updateUserDetails() async {
    DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
        .collection('Users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    if (userSnapshot.exists) {
      Map<String, dynamic> userData =
          userSnapshot.data() as Map<String, dynamic>;

      if (_image != null) {
        final bytes = await _image!.readAsBytes();

        var base64Image = base64Encode(bytes);

        userData.addAll({
          'First name': fName,
          'Last name': lName,
          'DOB': dob,
          'Gender': _value,
          'image': base64Image
        });
      } else {
        userData.addAll({
          'First name': fName,
          'Last name': lName,
          'DOB': dob,
          'Gender': _value,
        });
      }

      await FirebaseFirestore.instance
          .collection('Users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set(userData);
    }
  }

  Future<void> _getImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        CircleAvatar(
          backgroundImage: AssetImage(
            'assets/images/profile-icon-9.png',
          ),
          radius: 60,
          backgroundColor: Colors.blueGrey.shade100,
        );
      }
    });
  }

  late SharedPreferences shared;
  var token = "";

  Future<String> callPrefrence() async {
    shared = await SharedPreferences.getInstance();
    token = SharedPreferencesHelper.getString(SharedPrefKeys.token, shared)!;

    return token;
  }

  Widget updateFavouriteBuilder(String token) {
    CollectionReference library =
        FirebaseFirestore.instance.collection('Users');

    return FutureBuilder<DocumentSnapshot>(
      future: library.doc(token).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(); // Placeholder while loading
        } else if (snapshot.hasData && snapshot.data!.exists) {
          fNameText.text = snapshot.data!["First name"];
          lNameText.text = snapshot.data!["Last name"];
          emailText.text = snapshot.data!["Email"];
          _value = snapshot.data!["Gender"];
          dobText.text = snapshot.data!["DOB"];

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0, top: 10.0),
                child: Stack(
                  children: [
                    Container(
                      // height: 150,
                      // width: 150,
                      child: _image == null
                          ? Container(
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
                      )
                          : ClipOval(
                        child: Image.file(
                          _image!,
                          fit: BoxFit.cover,
                          height: 120,
                          width: 120,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 5,
                      right: 5,
                      child: Container(
                        height: 36,
                        width: 36,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Container(
                                      height: 170,
                                      width:
                                      MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(30),
                                            topRight: Radius.circular(30)),
                                        color: Colors.blueGrey.shade100,
                                      ),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 15),
                                            child: Text(
                                              'Choose Profile Photo',
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 30,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: [
                                              TextButton.icon(
                                                onPressed: () {
                                                  _getImage(
                                                      ImageSource.camera);
                                                },
                                                icon: Icon(Icons.camera),
                                                label: Text(
                                                  'Camera',
                                                  style: TextStyle(
                                                      color:
                                                      Theme.of(context)
                                                          .colorScheme
                                                          .primary,
                                                      fontSize: 17),
                                                ),
                                                style: ButtonStyle(
                                                    iconColor:
                                                    MaterialStateProperty
                                                        .all(
                                                      Theme.of(context)
                                                          .colorScheme
                                                          .primary,
                                                    ),
                                                    iconSize:
                                                    MaterialStateProperty
                                                        .all(45),
                                                    overlayColor:
                                                    MaterialStateProperty
                                                        .all(Colors
                                                        .blueGrey
                                                        .shade200)),
                                              ),
                                              SizedBox(
                                                width: 30,
                                              ),
                                              TextButton.icon(
                                                onPressed: () {
                                                  _getImage(
                                                      ImageSource.gallery);
                                                },
                                                icon: Icon(Icons.image),
                                                label: Text(
                                                  'Gallery',
                                                  style: TextStyle(
                                                      color:
                                                      Theme.of(context)
                                                          .colorScheme
                                                          .primary,
                                                      fontSize: 17),
                                                ),
                                                style: ButtonStyle(
                                                    iconColor:
                                                    MaterialStateProperty
                                                        .all(
                                                      Theme.of(context)
                                                          .colorScheme
                                                          .primary,
                                                    ),
                                                    iconSize:
                                                    MaterialStateProperty
                                                        .all(45),
                                                    overlayColor:
                                                    MaterialStateProperty
                                                        .all(Colors
                                                        .blueGrey
                                                        .shade200)),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    );
                                  });
                            },
                            child: Icon(
                              Icons.camera_alt,
                              color: Colors.white,
                              size: 20,
                            )),
                      ),
                    )
                  ],
                ),
              ),
              Text(
                'Edit Profile Photo',
                style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 40,
              ),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Enter First Name';
                  }

                  return null;
                },
                controller: fNameText,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11),
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.primary,
                      width: 2,
                    ),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(11)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(11),
                      borderSide: BorderSide(color: Colors.blueGrey.shade700)),
                  prefixIcon: Icon(
                    Icons.person,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  label: Text(
                    'First Name',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Enter Last Name';
                  }
                  return null;
                },
                controller: lNameText,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11),
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.primary,
                      width: 2,
                    ),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(11)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(11),
                      borderSide: BorderSide(color: Colors.blueGrey.shade700)),
                  prefixIcon: Icon(
                    Icons.person,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  label: Text(
                    'Last Name',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Enter Email';
                  } else if (!value.contains('@')) {
                    return 'Please Enter Valid Email';
                  }
                  return null;
                },
                onChanged: (value) {},
                initialValue: widget.emailAddress,
                controller: emailText,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11),
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.primary,
                      width: 2,
                    ),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(11)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(11),
                      borderSide: BorderSide(color: Colors.blueGrey.shade700)),
                  prefixIcon: Icon(
                    Icons.email,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  label: Text(
                    'Email Address',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Enter DOB';
                  }
                  return null;
                },
                controller: dobText,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11),
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.primary,
                      width: 2,
                    ),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(11)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(11),
                      borderSide: BorderSide(color: Colors.blueGrey.shade700)),
                  prefixIcon: Icon(
                    Icons.calendar_today,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  label: Text(
                    'Date Of Birth',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      Icons.calendar_month,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    onPressed: () async {
                      DateTime? datePicked = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1800),
                          lastDate: DateTime(4000));
                      if (datePicked != null) {
                        dobText.text =
                            '${datePicked.day}-${datePicked.month}-${datePicked.year}';
                        print(
                            'Date select: ${datePicked.day}-${datePicked.month}-${datePicked.year}');
                      }
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 280.0),
                child: Text(
                  'Gender :',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              Row(
                children: [
                  Radio(
                    value: 1,
                    groupValue: _value,
                    onChanged: (value) {
                      setState(() {
                        _value = value!;
                      });
                    },
                    fillColor: MaterialStateProperty.all(
                      Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  Text(
                    'Male',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Radio(
                    value: 2,
                    groupValue: _value,
                    onChanged: (value) {
                      setState(() {
                        _value = value!;
                      });
                    },
                    fillColor: MaterialStateProperty.all(
                      Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  Text(
                    'Female',
                    style: TextStyle(fontSize: 18),
                  )
                ],
              ),
            ],
          );
        } else {
          return Text("data");
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Profile',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              width: 370,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      'keep your personal details private. Information you add here is visible to anyone who can view your profile.',
                      style: TextStyle(
                          color: Colors.blueGrey.shade300,
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    ),
                  ),

                  FutureBuilder<String>(
                      future: callPrefrence(),
                      builder: (BuildContext context,
                          AsyncSnapshot<String> snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return CircularProgressIndicator(); // Placeholder while loading
                        } else {
                          return updateFavouriteBuilder(
                              snapshot.data.toString());
                        }
                      }),

                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: 200,
                    height: 55,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              fName = fNameText.text;
                              lName = lNameText.text;
                              email = emailText.text;
                              dob = dobText.text;
                            });
                            updateUserDetails();
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Your profile is edited.'),
                                backgroundColor: Colors.blueGrey,
                              ),
                            );
                          }
                          // Navigator.pushReplacement(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (contex) => NavigationMenu(
                          //         // fNameText.text.toString(),
                          //         // lNameText.text.toString()
                          //         ),
                          //  ),
                          // );
                        },
                        child: Text(
                          'Save',
                          style: TextStyle(
                              color: Colors.blueGrey.shade100, fontSize: 20),
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
          ),
        ),
      ),
    );
  }
}
