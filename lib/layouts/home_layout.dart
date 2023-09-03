import 'package:bmi_calculator/modules/archivedtasks/archived_tasks_screen.dart';
import 'package:bmi_calculator/modules/donetasks/done_tasks_screen.dart';
import 'package:bmi_calculator/modules/newtasks/new_tasks_screen.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';

import '../constants.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int currentindex = 0;
  late Database database;
  bool isbottomSheetShown = false;
  IconData fabIcon = Icons.edit;
  TextEditingController controller = TextEditingController();
  var timecontroller = TextEditingController();
  var datecontroller = TextEditingController();



  final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  List<Widget> screens = [
    newTasks(),
    doneTasks(),
    archivedTasks(),
  ];

  @override
  void initState() {
    super.initState();
    CreateDatabase();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldkey,
        appBar: AppBar(
          title: const Text('TO DO APP'),
        ),
        body: ConditionalBuilder(
          condition:  tasks.length>0,
          builder: (context)=>screens[currentindex],
          fallback: (context)=> Center(child: CircularProgressIndicator()),
        )
       ,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (isbottomSheetShown) {
              if (formkey.currentState!.validate()) {
                insertDatabase(
                        title: controller.text,
                        time: timecontroller.text,
                        date: datecontroller.text)
                    .then((value) {
                  Navigator.pop(context);
                  setState(() {
                    fabIcon = Icons.edit;
                  });
                });
              }
              // Hide the bottom sheet
            } else {
              scaffoldkey.currentState
                  ?.showBottomSheet(
                    (context) => Container(
                      color: Colors.grey.shade300,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Form(
                          key: formkey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextFormField(
                                controller: controller,
                                keyboardType: TextInputType.text,
                                onTap: () {
                                  print('task taped');
                                },
                                validator: (String? value) {
                                  if (value != null && value.isEmpty) {
                                    return 'Title must not be empty';
                                  } else {
                                    return null;
                                  }
                                },
                                decoration: const InputDecoration(
                                  labelText: 'Task title',
                                  prefixIcon: Icon(
                                    Icons.title,
                                  ),
                                  border:
                                      OutlineInputBorder(), // Add this line for border
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                controller: timecontroller,
                                keyboardType: TextInputType.none,
                                onTap: () {
                                  showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now(),
                                  ).then((TimeOfDay? value) {
                                    if (value != null) {
                                      setState(() {
                                        timecontroller.text =
                                            value.format(context).toString();
                                        print(value.format(context));
                                      });
                                    }
                                  });
                                },
                                validator: (String? value) {
                                  if (value != null && value.isEmpty) {
                                    return 'Time must not be empty';
                                  } else {
                                    return null;
                                  }
                                },
                                decoration: const InputDecoration(
                                  labelText: 'time',
                                  prefixIcon: Icon(
                                    Icons.watch,
                                  ),
                                  border:
                                      OutlineInputBorder(), // Add this line for border
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                controller: datecontroller,
                                keyboardType: TextInputType.text,
                                onTap: () {
                                  showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime.parse('2024-09-14'),
                                  ).then((value) {
                                    if (value != null) {
                                      final formattedDate =
                                          DateFormat.yMMMd().format(value);
                                      setState(() {
                                        datecontroller.text = formattedDate;
                                      });
                                    }
                                  });
                                },
                                validator: (String? value) {
                                  if (value != null && value.isEmpty) {
                                    return 'date must not be empty';
                                  } else {
                                    return null;
                                  }
                                },
                                decoration: const InputDecoration(
                                  labelText: 'date',
                                  prefixIcon: Icon(
                                    Icons.date_range_outlined,
                                  ),
                                  border:
                                      OutlineInputBorder(), // Add this line for border
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                  .closed
                  .then((value) {});

              setState(() {
                fabIcon = Icons.add;
              });
            }
            // Toggle the value of isbottomSheetShown
            isbottomSheetShown = !isbottomSheetShown;
          },
          child: Icon(
            fabIcon,
          ),
        ),

        // onPressed: () async {
        //   getname().then((value) {
        //     print(value);
        //     print('osama');
        //     throw("error");
        //   }).catchError((error) {
        //     print('error is ${error.toString()}');
        //   });
        // },

        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: currentindex,
          onTap: (index) {
            setState(() {
              currentindex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'tasks'),
            BottomNavigationBarItem(
                icon: Icon(Icons.check_circle), label: 'done'),
            BottomNavigationBarItem(
                icon: Icon(Icons.archive_outlined), label: 'archived')
          ],
        ));
  }

  Future<String> getname() async {
    return 'roaa';
  }

  void CreateDatabase() async {
    database = await openDatabase(
      'todo.db',
      version: 1,
      onCreate: (database, version) async {
        print("created");
        await database.execute(
            'create table tasks(id INTEGER PRIMARY KEY , title TEXT,date TEXT,time TEXT,status TEXT) ');
      },
      onOpen: (database) {
        getdata(database).then((value) {
          tasks = value;
        });
      },
    );
  }

  Future insertDatabase(
      {required String title,
      required String time,
      required String date}) async {
    return await database.transaction((txn) async {
      int id1 = await txn.rawInsert(
          'INSERT INTO tasks(title, date, time,status) VALUES(" $title", "$date", "$time","new")');
      print("insert done");
      getdata(database).then((value) {
        tasks = value;
      });
    });
  }

  Future<List<Map>> getdata(database) async {
    return await database.rawQuery('SELECT * FROM tasks');
  }
}
