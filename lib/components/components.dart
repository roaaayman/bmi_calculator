import 'package:flutter/material.dart';
Widget buildTaskItem(Map model)=>   Padding(
  padding: const EdgeInsets.all(20),
  child: Row(
    children: [
      CircleAvatar(
        radius: 35.0,
        child: Text(
            '${model['time']}',

        ),
      ),
      const SizedBox(width: 20,),
      Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '${model['title']}',
            style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold
            ),
          ),
          Text(
            '${model['date']}',
            style: const TextStyle(
              fontSize: 16.0,
              color: Colors.grey,
            ),
          )
        ],
      )
    ],
  ),
);