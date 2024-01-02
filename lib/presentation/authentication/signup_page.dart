import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:last/buisness%20layer/blocs/auth%20bloc/signup_bloc.dart';
import 'package:last/buisness%20layer/blocs/auth%20bloc/signup_s_e.dart';
import 'package:last/data%20layer/models/user_model.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    final TextEditingController email = TextEditingController();
    final TextEditingController pass = TextEditingController();
    final TextEditingController name = TextEditingController();
    
    SignUpBloc signUpBloc = BlocProvider.of<SignUpBloc>(context);
    
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: height,
          color: Colors.grey.shade300,
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(20, -1.2),
                child: Container(
                  height: width,
                  width: width,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.yellowAccent,
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-1.6, -1.2),
                child: Container(
                  height: width/1.5,
                  width: width/1.5,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,

                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(1.6, -1.2),
                child: Container(
                  height: width/1.5,
                  width: width/1.5,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue,
                  ),
                ),
              ),
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
                child: Container(),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                        size: 100,
                        color: Colors.white,
                        Icons.emoji_food_beverage
                    ),
                    SizedBox(height: 20),
                    Text("Register", style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: Colors.black12.withOpacity(0.6))),
                    SizedBox(height: 20,),
                    TextField(
                      controller: name,
                      decoration: InputDecoration(
                          fillColor: Colors.white24,
                          label: Text("Name"),
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)
                          )
                      ),
                    ),
                    SizedBox(height: 20,),
                    TextField(
                      controller: email,
                      decoration: InputDecoration(
                          fillColor: Colors.white24,
                          label: Text("Email"),
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)
                          )
                      ),
                    ),
                    SizedBox(height: 20,),
                    TextField(
                      controller: pass,
                      decoration: InputDecoration(
                          fillColor: Colors.white24,
                          label: Text("Password"),
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)
                          )
                      ),
                    ),
                    SizedBox(height: 15,),
                    ElevatedButton(
                        onPressed: () {
                          UserModel userModel = UserModel.empty;
                          userModel = userModel.copyWith(
                            name: name.text,
                            email: email.text,
                          );
                          signUpBloc.add(SignUpUserEvent(userModel: userModel, password: pass.text));
                        }, 
                        child: Text("Register", style: TextStyle(color: Colors.black)),),
                    SizedBox(height: 20),
                    RichText(
                      text: TextSpan(children: [
                        const TextSpan(
                          text: "Already have an account? ", style: TextStyle(color: Colors.black)
                        ),
                        TextSpan(
                            text: 'Login',
                            style:  TextStyle(
                              color: Colors.blue,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushNamed(context, '/');
                              }
                        ),
                      ]
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

      ),
    );
  }
}
