import 'package:flutter/material.dart';

class BMIResult extends StatelessWidget {
 final double result;
 final bool isMale;
 final int age;
 const BMIResult({super.key,
  required this.result,
  required this.isMale,
   required this.age,
});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      AppBar(
        title:
        const Text(
          'BMI Result'
        ),
      ),
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Gender:${isMale? "male": 'female' }'
              ,style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 40
            ),),
            Text('Result: $result'
              ,style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 40
            ),),
            Text('Age:$age'
              ,style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 40
            ),),
          ],
        ),
      ),
    );
  }
}
