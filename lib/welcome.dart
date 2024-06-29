import 'package:flutter/material.dart';
import 'package:to_do_application/firstScreen.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  void initState(){
    super.initState();
  }
  Widget build(BuildContext context) {
      return Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/images/image1.jpg"),fit: BoxFit.cover),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
         body: Column(
           crossAxisAlignment: CrossAxisAlignment.center,
           children: [
             Padding(
               padding: const EdgeInsets.symmetric(vertical: 100.0),
               child: Container(
                 child: Center(
                     child: Text("WELCOME TO \n REMINDERE",style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold,color: Colors.blue)),
                 ),
               ),
             ),
             Padding(
               padding: const EdgeInsets.only(top: 00.0),
               child: Container(
                 child: Image.asset("assets/images/img.png"),
               ),
             ),
             SizedBox(height: 40),
             Container(
               child: SizedBox(
                 height:48,
                 width: 450,
                 child: ElevatedButton(onPressed: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>Firstscreen()));
                 },style: ButtonStyle(backgroundColor: WidgetStateProperty.all<Color>(Colors.blueAccent),
                 shape: WidgetStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                   borderRadius: BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10)),
                   //side: BorderSide(color: Colors.white),
                 ))), child: Text('Get Started',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),)
                 ),
               ),
             )
           ],
         ),
        ),
      );
  }
}
