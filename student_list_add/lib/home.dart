import 'package:flutter/material.dart';

import 'package:provider/provider.dart';


import 'package:student_list_add/presentation/add_student.dart';

import 'package:student_list_add/presentation/list_student.dart';

import 'package:student_list_add/search.dart';

import 'provider/add_student_provider.dart';


class homescreen extends StatelessWidget {
  const homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<StudentAddProvider>(context, listen: false).getAllStudents();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[200],
        title: const Center(child: Text('Home')),
        actions: [
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: SearchWidget());
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body: Liststudents(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddStudent()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
