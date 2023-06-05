
import 'dart:io';

import 'package:flutter/material.dart';


class StudentDetails extends StatefulWidget {
  final String name;
  final String age; 
  final String phonenumber;
  final String place;
  final String photo;
   int? index;

   StudentDetails(
      {super.key,
      required this.name,
      required this.age,
      required this.phonenumber,
        required this.place,
      required this.photo,
       
      });
      

  @override
  State<StudentDetails> createState() => _StudentDetailsState();
}

class _StudentDetailsState extends State<StudentDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Details'),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Center(
                child: Text(
                  'Student Full Details',
                  style: TextStyle(fontSize: 25, color: Colors.red),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              CircleAvatar(
                radius: 80,
                backgroundImage: FileImage(
                  File(widget.photo,
                  ),
                ),
              ),
              
              const SizedBox(
                height: 10,
              ),
              Text(
                'Name:${widget.name}',
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Age:${widget.age}',
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'phonenumber:${widget.phonenumber}',
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'place:${widget.place}',
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
      ),
    );
  }

}