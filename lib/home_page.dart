import 'package:flutter/material.dart';
import 'package:todo_list_app/inputData.dart';
import 'package:todo_list_app/widgetscard.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<InputData> allData = [];
  TextEditingController todoEditing = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
              child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Container(
            width: size.width, //.infinity,
            height: size.height, //.infinity,

            child: Column(
              children: [
              
                Text(
                  "To Do List",
                  style: TextStyle(fontSize: 24, color: Colors.amber),
                ),
                SizedBox(
                  height: 50,
                ),
                Expanded(
                    child: ListView(
                  children: allData.map((data) => ToDoCard(data.text)).toList(),
                )),
                
                
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  
                  
                  child: TextField(
                    controller: todoEditing,
                    onChanged: (value) {
                      setState(() {
                        
                      });
                    },
                    style: TextStyle(fontSize: 20, color: Colors.amber),
                    decoration: InputDecoration(
                      isDense: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.amber,width: 3)
                        
                      ),
                   
                      // fillColor: Colors.white,
                      // filled: todoEditing.text.isNotEmpty? false:true,
                      labelText: "What to do?",
                      labelStyle: TextStyle(color:Colors.lightBlue),
                      hintText: "Just Do It!",
                      hintStyle: TextStyle(color: Colors.amber),
                      suffixIcon: Container(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              allData.add(InputData(
                                  text: todoEditing.text, isDone: false));
                                  todoEditing.text = '';
                                  
                            });
                          },
                          child: todoEditing.text.isNotEmpty ? Icon(
                            Icons.add_box_outlined,
                            size: 50,
                            color: Colors.lightBlue,
                          ):SizedBox(),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
