import 'package:flutter/material.dart';
import 'package:todo_list_app/roomDetail.dart';

class ToDoCard extends StatefulWidget {
  // const ToDoCard({Key? key}) : super(key: key);
  final String todo;
  ToDoCard(this.todo);

  @override
  _ToDoCardState createState() => _ToDoCardState();
}

class _ToDoCardState extends State<ToDoCard> {
  bool isDone = false;
  // String namatask=todo;
  @override
  Widget build(BuildContext context) {
    return Container(
    margin: EdgeInsets.only(bottom: 10),
    decoration: BoxDecoration(
      color: Colors.white, borderRadius: BorderRadius.circular(10)),
    child: Material(
      child: InkWell(
        onTap: (){
          setState(() {
            isDone = !isDone;
            print(isDone);
          });
        },
    onLongPress: (){Navigator.push(context,MaterialPageRoute(builder: (context) => RoomDetail(widget.todo) ),);},

  
    splashColor: Colors.cyan,
        child: ListTile(
      title: Text(
          widget.todo,
          style: TextStyle(
            decoration:
                isDone ? TextDecoration.lineThrough : TextDecoration.none,
          ),
      ),

      trailing: Icon(
          isDone ? Icons.check_box_outlined : Icons.check_box_outline_blank,
          color: isDone ? Colors.amber: Colors.lightBlue,
          size: 30,
      ),
      

      // trailing: Switch(value: value, onChanged: () {}),
    ),
      ),
    ),
      );
  }
}
