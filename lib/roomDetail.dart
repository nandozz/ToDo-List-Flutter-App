import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_list_app/descCard.dart';
import 'package:todo_list_app/inputData.dart';

// ignore: must_be_immutable
class RoomDetail extends StatefulWidget {
  // const RoomDetail({ Key? key }) : super(key: key);
String descTask;
RoomDetail(this.descTask);
  @override
  _RoomDetailState createState() => _RoomDetailState();
}

class _RoomDetailState extends State<RoomDetail> {


  List<DescData> allDesc = [];
  TextEditingController todoDesc = TextEditingController(text: "");
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
                Row(
                  children: [
                    IconButton(onPressed:(){Navigator.pop(context);

                    } , 
                    
                    icon: Icon(Icons.arrow_back_ios))


                  ],
                ),


              
                Text(
                  widget.descTask,
                  style: TextStyle(fontSize: 24, color: Colors.amber),
                ),
                SizedBox(
                  height: 50,
                ),
                Expanded(
                    child: ListView(
                  children: allDesc.map((data) => DescCard(data.cerita)).toList(),
                )),
                
                
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  
                  
                  child: TextField(
                    controller: todoDesc,
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
                      // filled: todoDesc.text.isNotEmpty? false:true,
                      labelText: "Describe tour task",
                      labelStyle: TextStyle(color:Colors.lightBlue),
                      hintText: "Detailed",
                      hintStyle: TextStyle(color: Colors.amber),
                      suffixIcon: Container(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              allDesc.add(DescData(todoDesc.text));
                              todoDesc.text = '';
                                  
                                  
                            });
                          },
                          child: todoDesc.text.isNotEmpty ? Icon(
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