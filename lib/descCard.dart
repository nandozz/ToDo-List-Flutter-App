import 'package:flutter/material.dart';



class DescCard extends StatefulWidget {
  // const DescCard({ Key? key }) : super(key: key);

  late final String descTask;
DescCard(this.descTask);

  @override
  _DescCardState createState() => _DescCardState();
}

class _DescCardState extends State<DescCard> {
  @override
  Widget build(BuildContext context) {
    bool isDetail=false;


    return Container(
      
    margin: EdgeInsets.only(bottom: 10),
    decoration: BoxDecoration(
      color: Colors.white, borderRadius: BorderRadius.circular(10)),
    child: Material(
      child: InkWell(
        onTap: (){isDetail = !isDetail;
            print(isDetail);
        },
   splashColor: Colors.cyan,
        child: ListTile(
      title: Text(
          widget.descTask,
          style: TextStyle(
            decoration:
                isDetail ? TextDecoration.lineThrough : TextDecoration.none,
          ),
      ),

      trailing: Icon(
          isDetail ? Icons.check_box_outlined : Icons.check_box_outline_blank,
          color: isDetail ? Colors.amber: Colors.lightBlue,
          size: 30,
      ),
      

      // trailing: Switch(value: value, onChanged: () {}),
    ),
      ),
    ),
    );
  }
}