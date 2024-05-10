import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_4/navigationbarpages/navigation_menu.dart';
import 'package:project_4/userpages/user_login_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserCreateScreen extends StatefulWidget {
  @override
  State<UserCreateScreen> createState() => _UserCreateScreenState();
}

class _UserCreateScreenState extends State<UserCreateScreen> {
  final _formKey = GlobalKey<FormState>();

  var email = "";
  var userName = "";
  var password = "";
  var rePassword = "";

  var emailText = TextEditingController();
  var userText = TextEditingController();
  var passText = TextEditingController();
  var rePassText = TextEditingController();

  bool isPassVisible = true;
  bool isPassVisible2 = true;

  void dispose() {
    emailText.dispose();
    userText.dispose();
    passText.dispose();
    rePassText.dispose();
    super.dispose();
  }

  registration() async {
    if (password == rePassword) {
      try {
        final credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        addUserDetails();
        print(credential);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (contex) => NavigationMenu()));
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('The password provided is too weak.'),
              backgroundColor: Colors.blueGrey,
            ),
          );
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('The account already exists for that email.'),
              backgroundColor: Colors.blueGrey,
            ),
          );
        }
      } catch (e) {
        print(e);
      }
    } else {
      print("Password and Confirm Password doesn't match.");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text("Password and Confirm Password doesn't match."),
          backgroundColor: Colors.blueGrey,
        ),
      );
    }
  }

 void addUserDetails() async {
    await FirebaseFirestore.instance.collection('Users').doc(FirebaseAuth.instance.currentUser!.uid).set({
      'Email': email,
      'Username':userName,
      'Password':password,
      'Re Password':rePassword,
      'image':'',
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Stack(children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset(
              'assets/images/new one.png',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: Container(
                width: 350,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Create Account',
                          style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.primary,),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 70,
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
                      onChanged: (value) {
                        email = value; // Update email variable on change
                      },
                      keyboardType: TextInputType.emailAddress,
                      controller: emailText,
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
                            borderSide:
                                BorderSide(color: Colors.blueGrey.shade700)),
                        prefixIcon: Icon(
                          Icons.email,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        label: Text(
                          'Email Address',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: Theme.of(context).colorScheme.primary,),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Username';
                        }
                        return null;
                      },
                      controller: userText,
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
                            borderSide:
                                BorderSide(color: Colors.blueGrey.shade700)),
                        prefixIcon: Icon(
                          Icons.person,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        label: Text(
                          'Username',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: Theme.of(context).colorScheme.primary,),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Password';
                        }
                        return null;
                      },
                      controller: passText,
                      obscureText: isPassVisible,
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
                            borderSide:
                                BorderSide(color: Colors.blueGrey.shade700)),
                        prefixIcon: Icon(
                          Icons.key,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        label: Text(
                          'Password',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: Theme.of(context).colorScheme.primary,),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            isPassVisible
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          onPressed: () {
                            setState(() {
                              isPassVisible = !isPassVisible;
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Re-write Password';
                        }
                        return null;
                      },
                      controller: rePassText,
                      obscureText: isPassVisible2,
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
                            borderSide:
                                BorderSide(color: Colors.blueGrey.shade700)),
                        prefixIcon: Icon(
                          Icons.key,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        label: Text(
                          'Re-write Password',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: Theme.of(context).colorScheme.primary,),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            isPassVisible2
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          onPressed: () {
                            setState(() {
                              isPassVisible2 = !isPassVisible2;
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      height: 55,
                      width: 300,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              email = emailText.text;
                              userName = userText.text;
                              password = passText.text;
                              rePassword = rePassText.text;
                            });
                            registration();
                          }
                        },
                        child: Text(
                          'Sign up',
                          style: TextStyle(
                              color: Colors.blueGrey.shade100, fontSize: 20),
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            Theme.of(context).colorScheme.primary,),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 9,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account? ',
                          style: TextStyle(
                              color: Colors.blueGrey.shade400,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (contex) =>
                                          UserRegisterScreen()));
                            },
                            child: Text(
                              'Log in',
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 17),
                            ))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
