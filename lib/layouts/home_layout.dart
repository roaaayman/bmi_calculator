import 'package:bmi_calculator/modules/archivedtasks/archived_tasks_screen.dart';
import 'package:bmi_calculator/modules/donetasks/done_tasks_screen.dart';
import 'package:bmi_calculator/modules/newtasks/new_tasks_screen.dart';
import 'package:flutter/material.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int currentindex=0;
  List<Widget> screens=
      [
        newTasks(),
        doneTasks(),
        archivedTasks(),
      ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('TO DO APP'),
        ),
        body:screens[currentindex] ,
        floatingActionButton: FloatingActionButton(
          onPressed: () async{
            var name= await getname();
                print(name);
          },

          child: const Icon(
            Icons.add,
          ),
        ),
        bottomNavigationBar: BottomNavigationBar
          (
          type: BottomNavigationBarType.fixed,
           currentIndex: currentindex ,
          onTap: (index){

           setState(() {
             currentindex=index;
           });
          }
          ,
          items: const [
            BottomNavigationBarItem(icon: Icon(
                Icons.menu
            ), label: 'tasks'),
            BottomNavigationBarItem(icon: Icon(
                Icons.check_circle
            ), label: 'done'),
            BottomNavigationBarItem(icon: Icon(
                Icons.archive_outlined
            ), label: 'archived')

          ],
        )
    );
  }
  Future<String> getname() async
  {
    return 'roaa' ;
  }
}
