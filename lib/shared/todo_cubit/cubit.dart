import 'package:bloc/bloc.dart';
import 'package:bmi_calculator/shared/todo_cubit/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../modules/archivedtasks/archived_tasks_screen.dart';
import '../../modules/donetasks/done_tasks_screen.dart';
import '../../modules/newtasks/new_tasks_screen.dart';

class Appcubit extends Cubit<Appstates>
{
  int currentindex = 0;
  List<Widget> screens = [newTasks(), doneTasks(), archivedTasks()];
  Appcubit(): super(Appinitialstates());
  static Appcubit get(context)=> BlocProvider.of(context);
  void changeindex(int index)
  {
    currentindex=index;
    emit(AppChangeBottomNavBarState());
  }

}