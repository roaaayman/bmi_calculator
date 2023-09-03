import 'package:bmi_calculator/components/components.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class newTasks extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return ListView.separated
      (itemBuilder: (context,index)=>buildTaskItem(tasks[index]),
        separatorBuilder: (context,index)=>Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: double.infinity,
            height: 1,
            color: Colors.grey.shade300,
          ),
        ), itemCount: tasks.length);
   
  }
}
