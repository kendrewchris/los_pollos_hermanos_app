import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import '../components/user_field.dart';
import '../components/user_button.dart';
import '../components/square_tile.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {

  //text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  signUserIn(){
    Text('This will do something in the future');
  }
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Padding(
        padding: const EdgeInsets.all(19.0),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //icon
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Image.asset(
                  './lib/images/logo.png', 
                  height: 250,),
              ),

              //UserName Field
              UserField(controller: usernameController, hintText: 'User Name', obscureText: false,),
              //Password Field
              UserField(controller: passwordController, hintText: 'Password', obscureText: true,),

              //forgot password
              Padding(
                padding: const EdgeInsets.only(top: 14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forgot Password?',
                      style: GoogleFonts.dmSerifText(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),

              //sign in button
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: UserButton(onTap: signUserIn(),),
              ),

              //divider
              Padding(
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
                      child: Text('Or continue with', style: TextStyle(color: Colors.black,),
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
                  SquareTile(imagePath: './lib/images/google.png',),
                  const SizedBox(width: 25,),
                  //google button
                  SquareTile(imagePath: './lib/images/apple.png',)
                ],
               ),


              //user registration
              Padding(
                padding: const EdgeInsets.only(top: 35),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Not a member?', style: TextStyle(color: Colors.black,),),
                    const SizedBox(width: 8,),
                    Text('Register now', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}



