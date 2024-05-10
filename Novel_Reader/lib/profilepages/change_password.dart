import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChangePasswordScreen extends StatefulWidget {
  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _formKey = GlobalKey<FormState>();

  var oldPass = '';
  var newPass = '';
  var confirmPass = '';

  var oldpassText = TextEditingController();
  var newpassText = TextEditingController();
  var confirmpassText = TextEditingController();

  bool isPassVisible = true;
  bool isPassVisible2 = true;
  bool isPassVisible3 = true;

  void dispose() {
    oldpassText.dispose();
    newpassText.dispose();
    confirmpassText.dispose();
    super.dispose();
  }

  final currentUser = FirebaseAuth.instance.currentUser;

  changePassword() async {
    if (newPass == confirmPass) {
      try {
        await currentUser?.updatePassword(newPass);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Your password has been changed.'),
            backgroundColor: Colors.blueGrey,
          ),
        );
        updatePasswordDetails();
      } catch (e) {
        print(e);
      }
    }
  }

  void updatePasswordDetails() async {
    DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
        .collection('Users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    if (userSnapshot.exists) {
      Map<String, dynamic> userData =
          userSnapshot.data() as Map<String, dynamic>;
      userData.addAll({
        'Old Password': oldPass,
        'New Password': newPass,
        'Confirm Password': confirmPass,
      });
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set(userData);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Change Password',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Colors.blueGrey.shade900),
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
                  Text(
                    'Enter New Password',
                    style: TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Your new password must be different',
                    style: TextStyle(
                        color: Colors.blueGrey.shade300,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    ' form previously used password',
                    style: TextStyle(
                        color: Colors.blueGrey.shade300,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Old Password';
                      }
                      return null;
                    },
                    controller: oldpassText,
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
                        borderRadius: BorderRadius.circular(11),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11),
                          borderSide:
                              BorderSide(color: Colors.blueGrey.shade700)),
                      prefixIcon: Icon(
                        Icons.key,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      label: Text(
                        'Old Password',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          isPassVisible
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        onPressed: () {
                          setState(
                            () {
                              isPassVisible = !isPassVisible;
                            },
                          );
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
                        return 'Please Enter New Password';
                      }
                      return null;
                    },
                    controller: newpassText,
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
                        'New Password',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).colorScheme.primary,
                        ),
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
                    height: 15,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Confirm Password';
                      }
                      return null;
                    },
                    controller: confirmpassText,
                    obscureText: isPassVisible3,
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
                        'Confirm Password',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          isPassVisible3
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.blueGrey.shade900,
                        ),
                        onPressed: () {
                          setState(() {
                            isPassVisible3 = !isPassVisible3;
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  SizedBox(
                    width: 200,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          setState(
                            () {
                              oldPass = oldpassText.text;
                              newPass = newpassText.text;
                              confirmPass = confirmpassText.text;
                            },
                          );
                          changePassword();
                        }
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
