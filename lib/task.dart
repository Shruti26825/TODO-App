import 'package:flutter/material.dart';

class Task extends StatefulWidget {
  const Task({super.key});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  List todoList=[];
  String singlevalue="";

  addString(content){
    setState(() {
      singlevalue=content;
    });
  }

  addList(){
    setState(() {
      todoList.add({"value":singlevalue});
    });
  }

  deleteItem(index){
    setState(() {
      todoList.removeAt(index);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Task Management",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        backgroundColor: Colors.blue[600],
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        color: Colors.white30,
        //margin: EdgeInsets.all(0),
        child: Column(
          children: [
            Expanded(
                flex: 90,
                child:ListView.builder(
                    itemCount: todoList.length,
                    itemBuilder: (context,index){
                      return Card(

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        color: Colors.white,
                        child: SizedBox(
                          height: 50,
                          width: double.infinity,
                          child: Container(
                            margin: EdgeInsets.only(left: 20),
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(5),
                            child: Row(
                              children: [
                                Expanded(
                                  flex:80,
                                  child: Text(todoList[index]["value"].toString(),
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),

                                ),
                                Expanded(
                                    flex: 20,
                                    child: CircleAvatar(
                                      radius: 30,
                                      backgroundColor: Colors.white,
                                      child: TextButton(
                                        onPressed: (){
                                          deleteItem(index);
                                        },
                                        child: Icon(Icons.delete,
                                          color: Colors.black,
                                        ),
                                      ),
                                    )
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    })

            ),
            Expanded(
                flex:10,
                child: Row(
                  children: [
                    Expanded(
                        flex:70,
                        child: Container(
                          height: 50,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: TextFormField(
                              onChanged: (content){
                                addString(content);
                              },
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  fillColor: Colors.white,
                                  filled: true,
                                  labelText: 'Create Task...',labelStyle: TextStyle(
                                  color: Colors.indigo[900],
                                  fontWeight: FontWeight.bold,
                              )
                              ),
                            ),
                          ),
                        )
                    ),
                    Expanded(
                        flex: 3,
                        child: SizedBox(width: 5)),

                    Expanded(
                        flex: 27,
                        child: ElevatedButton(onPressed: (){
                          addList();

                        },child: Container(
                            height: 15,
                            width: double.infinity,
                            alignment: Alignment.center,
                            child: Text('Add',style: TextStyle(color: Colors.blue[500]),)))),


                  ],
                ))
          ],
        ),
      ),

    );
  }
}
