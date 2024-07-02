// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:to_do_application/login.dart';
import 'package:to_do_application/uiHelper.dart';

class TaskManagement extends StatefulWidget {
  const TaskManagement({super.key});

  @override
  State<TaskManagement> createState() => _TaskManagementState();
}

class _TaskManagementState extends State<TaskManagement> {
  TextEditingController taskcontroller=TextEditingController();
  TextEditingController datecontroller= TextEditingController();
  TextEditingController timecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Login()));
          },),
        backgroundColor: Colors.blue[600],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Text('Task Management',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
            ),
            Icon(Icons.menu_outlined)
          ],
        ),
        centerTitle: true,
      ),
      body: ListView.separated(itemBuilder: (context,index){
        return ListTile(
          title: Text("Meeting",
              style: TextStyle(
                  color: Colors.blueGrey[700],
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
          ),
          subtitle: Text("Tomorrow,12:45 PM",style: TextStyle(color: Colors.blueGrey),),
        );
      }, separatorBuilder: (context,index){
        return Divider(
          color: Color(0XFF8BCCF8),
          thickness: 1.2,
          height: 1,
        );
      }, itemCount: 5),

      floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
             size: 35,
              color: Colors.blueAccent,
          ),
          onPressed: ()=>{
          showDialog(context: context, builder: (context){
            return Dialog(
            backgroundColor: Colors.blueGrey[800],
            child: SizedBox(
             height: 500,
             width: 500,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Center(
                     child: Text("New Task",style: TextStyle(color: Colors.white,fontSize: 20),
                     ),
                   ),
                   SizedBox(height: 15),
                    Text("data",style: TextStyle(color: Color(0XFF8BCCF8))
                    ),
                  Uihelper.CustomtextField(taskcontroller, 'Enter task',null, false),
                   SizedBox(height: 50),
                   //Text("Due Date",style: TextStyle(color: Color(0XFF8BCCF8))
                   //),
                   // Uihelper.CustomtextField(datecontroller, 'Enter Date',Icons.calendar_month_outlined,false),
                   // SizedBox(height: 30),
                   // Uihelper.CustomtextField(timecontroller, 'Enter Time', null, false),
                   // SizedBox(height: 30),
                   // Uihelper.CustomButton((){
                   //   //Navigator.push(context, MaterialPageRoute(builder: (context)=>TaskManagement()));
                   //}, "Create")
                   // Center(
                   //   child: ElevatedButton(onPressed: (){
                   //
                   //   }, child: Text("Create",style: TextStyle(color: Colors.blue[500]))),
                   // )
                   //Uihelper.CustomtextField(timecontroller, 'Enter Time'),
               ],
              ),
            ),
         ),
        );
      }
    ),
    // body: Column(
    //   crossAxisAlignment: CrossAxisAlignment.center,
    //   children: [
    //     Padding(
    //       padding: const EdgeInsets.symmetric(vertical: 120.0),
    //       child: Image(image: AssetImage("assets/images/task2.png")),
    //     ),
    //     Center(child: Padding(
    //       padding: const EdgeInsets.only(top: 5),
    //       child: Text('No Tasks added yet!',style: TextStyle(fontSize:20)),
    //     )),
    //   ],
    // ),
    // floatingActionButton: FloatingActionButton(
    //     child: Icon(
    //       Icons.add,
    //           size: 35,
    //           color: Colors.blueAccent,
    //     ),//shape: RoundedRectangleBorder(),
    //     onPressed: ()=>showModalBottomSheet(
    //       context: context,
    //       builder: (BuildContext context)=>Container(
    //       height: 250,
    //         width: 500,
    //         color: Colors.grey,
    //         child: Column(
    //           children: [
    //             Row(
    //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //               children: [
    //                 Text('Add Task',style: TextStyle(fontSize: 20,color: Colors.black)
    //                 ),
    //                 GestureDetector(
    //                   onTap: ()=>Navigator.of(context).pop(),
    //                   child: Icon(Icons.close),
    //                 ),
    //               ],
    //             ),
    //             Divider(thickness:1.2),
    //             SizedBox(height: 20.0,),
    //             SizedBox(
    //               height: 100,
    //               width: 380,
    //               child:
    //               //Uihelper.CustomTextField(emailcontroller, "Task"),
    //               TextField(
    //                 decoration: InputDecoration(
    //                   border: OutlineInputBorder(
    //                     borderRadius: BorderRadius.circular(5.0),
    //                     borderSide: BorderSide(color: Colors.white),
    //                   ),
    //                   fillColor: Colors.white,
    //                   filled: true,
    //                   hintText: "Enter Task",
    //                 ),
    //                ),
    //             ),
    //             //SizedBox(height: 5),
    //             Row(
    //               children: [
    //                 Container(
    //                   child: SizedBox(
    //                     height: 45,
    //                     width: 195,
    //                     child: ElevatedButton(onPressed: () {
    //
    //                     },style: ButtonStyle(backgroundColor: WidgetStateProperty.all<Color>(Colors.white),
    //                         shape:WidgetStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
    //                             borderRadius: BorderRadius.circular(5.0)))),
    //                         child: Text('Add')),
    //                     ),
    //                 ),
    //                 Container(
    //                   child: SizedBox(
    //                     height: 45,
    //                     width: 195,
    //                     child: ElevatedButton(onPressed: () {
    //
    //                     },style: ButtonStyle(backgroundColor: WidgetStateProperty.all<Color>(Colors.white),
    //                       shape:WidgetStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
    //                         borderRadius: BorderRadius.circular(5.0)))),
    //                       child: Text('Reset')),
    //                   ),
    //                 ),
    //               ],
    //             )
    //           ],
    //         ),
    //       )
    //     ),
    //   ),
    },
      ),
      );
  }
}
