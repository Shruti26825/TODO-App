import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do_application/firstScreen.dart';
import 'package:to_do_application/task_management.dart';
import 'package:to_do_application/uiHelper.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  //bool? check=prefs.getBool("isLogin");
  bool isPassVisible=true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Firstscreen()));
          },),
      ),
      body:SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical:0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Center(child: Image.asset("assets/images/login1.jpg",height: 270,width: 300,)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text("Welcome Back!",style:TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                ),
                //Text("Create a new account",style: TextStyle(fontSize: 15),),
                SizedBox(height: 30,),
                Uihelper.CustomTextField(emailController, 'User@gmail.com',Icons.mail,false,''),
                SizedBox(height: 30,),
               // Uihelper.CustomTextField(passwordController, 'Enter your password',Icons.remove_red_eye,true,"*"),
                Padding(padding: EdgeInsets.symmetric(horizontal: 20,vertical: 1),
                  child: Uihelper.CustomPassword(passwordController, 'Enter password', "Password",isPassVisible,(){
                    setState(() {
                      isPassVisible=!isPassVisible;
                      log(isPassVisible.toString());
                    });
                  }),
                ),

                Padding(
                  padding: const EdgeInsets.only(left:190.0),
                  child: TextButton(onPressed: (){}, child: Text("Forgot password?"),
                  ),
                ),
                SizedBox(height: 30,),
                Uihelper.CustomButton((){
                  signup(emailController.text.toString(), passwordController.text.toString());
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>TaskManagement()));
                } ,"Log In"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 30,),
                    Text("Don't have an account?"),
                    TextButton(onPressed: (){}, child: Text("Sign Up"),
                        style: TextButton.styleFrom(
                            foregroundColor: Colors.deepPurple,
                            textStyle: TextStyle(
                                decoration: TextDecoration.underline)))
                  ],
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
  signup(String email,String password) async {
    if(email=="" || password==""){
      return Uihelper.CustomAlertBox(context, "Enter Requried field");
    }
    else{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool("isLogin", true);
      log("Data Added");
    }
  }
}


