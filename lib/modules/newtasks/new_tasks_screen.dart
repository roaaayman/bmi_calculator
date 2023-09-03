import 'package:bmi_calculator/components/components.dart';
import 'package:flutter/material.dart';

class newTasks extends StatelessWidget {
  const newTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated
      (itemBuilder: (context,index)=>buildTaskItem(),
        separatorBuilder: (context,index)=>Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: double.infinity,
            height: 1,
            color: Colors.grey.shade300,
          ),
        ), itemCount: 10);
   
  }
}
