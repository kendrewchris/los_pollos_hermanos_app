//sdk package imports
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:los_pollos_hermanos_app/services/auth_services.dart';
 
//custom widget class imports
import '../components/user_field.dart';
import '../components/user_button.dart';
import '../components/square_tile.dart';


class RegisterPage extends StatefulWidget{
  final Function()? onTap;
  RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmController = TextEditingController();

  //alert box to indicate to user error in sign in
  void showErrorMessage(String message){
    showDialog(
      context: context, 
      builder: (context){
        return AlertDialog(
          backgroundColor: Colors.deepPurple,
          title: Center(
            child: Text(
              message,
              style: TextStyle(color: Colors.white),
            )
          )
        );
      },
    );
  }

  // sign up user method
  void signUserUp() async {
    //show loading circle
    showDialog(context: context, builder: (context){
      return const Center(child: CircularProgressIndicator(),);
    });

    //check if password and confirmed passwod is the same
    if(passwordController.text != passwordConfirmController.text){
      Navigator.pop(context);
      showErrorMessage('Passowrds do not match');
      return;
    }

    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailController.text, password: passwordController.text);
      Navigator.pop(context);
    } on FirebaseAuthException catch(e) {
        Navigator.pop(context);
        showErrorMessage(e.code);
      }
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Padding(
        padding: const EdgeInsets.all(19.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                //welcome banner text
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Welcome to a Taste',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'of New Mexico',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                 //UserName Field
                UserField(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                ),
                //Password Field
                UserField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),
                //confirm password field
                UserField(
                  controller: passwordConfirmController,
                  hintText: 'Confirm Password',
                  obscureText: true,
                ),
            
                //sign up button
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: UserButton(
                    onTap: signUserUp,
                    buttonText: 'Sign Up',
                  ),
                ),
            
                //divider
                const Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.black,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          'Or continue with',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
            
                //google & apple sign in
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //apple button
                    SquareTile(
                      imagePath: './lib/images/google.png',
                      onTap: () => AuthService().signInWithGoogle(),
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    //google button
                    SquareTile(
                      imagePath: './lib/images/apple.png',
                      onTap: () {},
                    )
                  ],
                ),
            
                //user registration
                Padding(
                  padding: EdgeInsets.only(top: 35),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account?',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: Text(
                          'Login now',
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


