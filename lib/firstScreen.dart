import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do_application/login.dart';
import 'package:to_do_application/task_management.dart';
import 'package:to_do_application/uiHelper.dart';
import 'package:to_do_application/welcome.dart';

class Firstscreen extends StatefulWidget {
  const Firstscreen({super.key});

  @override
  State<Firstscreen> createState() => _FirstscreenState();
}

class _FirstscreenState extends State<Firstscreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  //bool?check=prefs.getBool("isLogin");
  bool isPassVisible=true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Welcome()));
          },),
      ),
      body:SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Center(child: Image.asset("assets/images/signup3.jpg",height: 200,width: 350,)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text("Hi!",style:TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text("let's help to meet up your task.",style: TextStyle(fontSize: 12),),
              ),
              SizedBox(height: 30,),
              Uihelper.CustomTextField(nameController, 'Enter your name',Icons.account_circle,false,''),
              SizedBox(height: 30,),
              Uihelper.CustomTextField(emailController, 'User@gmail.com',Icons.mail,false,''),
              SizedBox(height: 30,),
              Padding(padding: EdgeInsets.symmetric(horizontal: 20,vertical: 1),
                child: Uihelper.CustomPassword(passwordController, 'Enter password', "Password",isPassVisible,(){
                  setState(() {
                    isPassVisible=!isPassVisible;
                    log(isPassVisible.toString());
                  });
                }),
              ),

              SizedBox(height: 30,),
              Uihelper.CustomButton((){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
              } ,"Register"),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 5,),
                  Text('Already have an account?'),
                  TextButton(onPressed: (){
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>Login()));
                  },
                      child: Text("Sign In"),
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
    );
  }
  // signup(String email,String password) async {
  //   if(email=="" || password==""){
  //     return Uihelper.CustomAlertBox(context, "Enter Requried field");
  //   }
  //   else{
  //     SharedPreferences prefs = await SharedPreferences.getInstance();
  //     prefs.setBool("isLogin", true);
  //     log("Data Added");
  //   }
  // }
// void togglePasswordView(){
//     setState(() {
//       isPassVisible=!isPassVisible;
//     });
// }
}
