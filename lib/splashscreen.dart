import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do_application/welcome.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState(){
    Timer(Duration(seconds:4),()async{
      SharedPreferences prefs=await SharedPreferences.getInstance();
      bool?check=prefs.getBool("isLogin");
      Navigator.push(context, MaterialPageRoute(builder: (context)=>Welcome()));
    });
        super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              // height: 1500,
              // width: double.infinity,
              child: Image.asset("assets/images/todo2.gif",height: 700,width: 600,),
              height: 300,
            ),
            Container(
              child: Text("REMINDERE",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25)),
            )
            //CircularProgressIndicator()
          ],
        ),
      ),
    );
  }
}
