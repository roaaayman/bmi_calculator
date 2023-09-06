import 'package:bmi_calculator/counter/cubit/cubit.dart';
import 'package:bmi_calculator/counter/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// state less contain one class provide widget

// state ful contain  classes

// 1. first class provide widget
// 2. second class provide state from this widget

class CounterScreen extends StatelessWidget
{

      @override
  Widget build(BuildContext context) {

      return BlocProvider(
        create: (BuildContext context)=>CounterCubit(),
        child: BlocConsumer<CounterCubit,counterstates>(
          listener: (context,state){
            if(state is CounterInitialState )print('intial state');
            if(state is CounterMinusState )print('MINUS state ${state.counter}');
            if(state is CounterPlusState )print('PLUS state${state.counter}');

          },
          builder: (context,state)
          {
            final counterCubit = BlocProvider.of<CounterCubit>(context);
          return  Scaffold(
              appBar: AppBar(
                title: const Text(
                  'Counter',
                ),
              ),
              body: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: ()
                      {


                        counterCubit.minus();


                      },
                      child: const Text(
                        'MINUS',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                      ),
                      child: Text(
                        '${CounterCubit.get(context).counter}',
                        style: const TextStyle(
                          fontSize: 50.0,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: ()
                      {

                        counterCubit.plus();
                      }

                      ,
                      child: const Text(
                        'PLUS',
                      ),
                    ),
                  ],
                ),
              ),
            );
          },

        ),
      );
    }
  }

