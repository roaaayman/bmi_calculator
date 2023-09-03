import 'package:flutter/material.dart';
Widget buildTaskItem()=>   Padding(
  padding: const EdgeInsets.all(20),
  child: Row(
    children: [
      CircleAvatar(
        radius: 35.0,
        child: Text(
            '2;00'
        ),
      ),
      SizedBox(width: 20,),
      Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'TASK TITLE',
            style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold
            ),
          ),
          Text(
            '2 april',
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.grey,
            ),
          )
        ],
      )
    ],
  ),
);