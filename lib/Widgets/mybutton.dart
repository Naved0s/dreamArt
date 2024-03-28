import 'package:flutter/material.dart';
import 'package:myapp/Logic/config.dart';

class MyButton extends StatelessWidget {
  final VoidCallback fn;
   const MyButton({super.key, required this.fn});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>fn(),
      child: Container(
        width: double.infinity,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xffacc2ef)
        ),
        child: const Center(
          child: Text('Generate',style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18
          ),),
        ),
      ),
    );
  }
}