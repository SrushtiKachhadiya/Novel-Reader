import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_4/userpages/user_create_screen.dart';
import 'package:project_4/userpages/user_login_screen.dart';

class UserForgetPassScreen extends StatefulWidget {
  @override
  State<UserForgetPassScreen> createState() => _UserForgetPassScreenState();
}

class _UserForgetPassScreenState extends State<UserForgetPassScreen> {
  final _formKey = GlobalKey<FormState>();

  var email = "";

  var emailText = TextEditingController();

  void dispose() {
    emailText.dispose();
    super.dispose();
  }

  resetPassword() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Password reset email sent successfully.'),
          backgroundColor: Colors.blueGrey,
        ),
      );
      print('Password reset email sent successfully.');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('No user found for that email.'),
            backgroundColor: Colors.blueGrey,
          ),
        );
        print('No user found for that email.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Stack(
          children: [
            SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Image.asset(
                'assets/images/new one 2.png',
                fit: BoxFit.cover,
              ),
            ),
            Center(
              child: Container(
                width: 350,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Forgot Your Password',
                          style: TextStyle(
                              fontSize: 33,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.primary),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Please enter the email address you'd like your",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.blueGrey.shade400,
                                fontWeight: FontWeight.w600)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("password reset information sent to",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.blueGrey.shade400,
                                fontWeight: FontWeight.w600)),
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Enter email address",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.blueGrey.shade600,
                                fontWeight: FontWeight.w600)),
                      ],
                    ),
                    SizedBox(
                      height: 10,
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
                            borderSide: BorderSide(
                              color: Colors.blueGrey.shade700,
                            )),
                        prefixIcon: Icon(
                          Icons.email,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        label: Text(
                          'Email',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: Colors.blueGrey.shade900),
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
                            setState(
                              () {
                                email = emailText.text;
                              },
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Password reset email sent not successfully.'),
                                backgroundColor: Colors.blueGrey,
                              ),
                            );
                            print('Password reset email sent not successfully.');
                          }
                          resetPassword();
                          //   print('Request is not accepted.');
                        },
                        child: Text(
                          'Request reset link',
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
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account? ",
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
                                builder: (contex) => UserCreateScreen(),
                              ),
                            );
                          },
                          child: Text(
                            ' Sign up',
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                                fontWeight: FontWeight.w900,
                                fontSize: 17),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Or ',
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
                                builder: (contex) => UserRegisterScreen(),
                              ),
                            );
                          },
                          child: Text(
                            'Back to Login',
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                                fontSize: 16,
                                fontWeight: FontWeight.w900),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
