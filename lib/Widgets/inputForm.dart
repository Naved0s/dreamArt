import 'package:flutter/material.dart';

class UserInputForm extends StatelessWidget {
  final TextEditingController tx;
   const UserInputForm({super.key, required this.tx});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
       
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xff4d648d)
      ),
      height: 120,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Enter your prompt',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.w400
              ),),
            const  SizedBox(height: 5,),
              TextFormField(
                controller: tx,
                enabled: true,
                style: const TextStyle(
                  color: Colors.white
                ),
               decoration: const InputDecoration(
                     hintText: 'A nation led by Ai',
                     border: OutlineInputBorder(
                      
                     ),
                     
                                       ),
                
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}