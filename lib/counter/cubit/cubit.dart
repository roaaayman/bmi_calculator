import 'package:bloc/bloc.dart';
import 'package:bmi_calculator/counter/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<counterstates>{
  CounterCubit(): super(CounterInitialState());

  static CounterCubit get(context)=> BlocProvider.of(context);
  int counter=1;
  void minus(){
    counter--;
emit(CounterMinusState(counter)); //WE USE EMIT TO CHANGE THE STATE
  }

  void plus(){
    counter++;
    emit(CounterPlusState(counter));

  }

}