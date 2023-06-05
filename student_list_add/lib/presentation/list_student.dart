import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:student_list_add/detial.dart';

import 'package:student_list_add/presentation/edit_student.dart';

import '../provider/add_student_provider.dart';






class Liststudents extends StatelessWidget {
   Liststudents({super.key});

  @override
  Widget build(BuildContext context) {
 

    return Consumer<StudentAddProvider>(
      builder:(context ,data,_)=> ListView.separated(
      itemBuilder: (ctx,index){
        final data = studentlist[index];
        return ListTile(
        
          title: Text(studentlist[index].name ),
          subtitle: Text(studentlist[index].age),
          onTap:(){
            Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>StudentDetails(name: data.name, age: data.age, phonenumber: data.phonenumber, place: data.place, photo: data.photo )));
          } ,
           trailing: Wrap(
                spacing: 12,
                children: <Widget>[
                  IconButton(
                    onPressed: (() {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: ((context) {
                            return EditStudent(
                                name: data.name,
                                age: data.age,
                                phonenumber: data.phonenumber,
                                place: data.place,
                                index: index,
                                  photo: data.photo,
                               );
                          }),
                        ),
                      );
    
                      // if (data.id != null) {
                      //   deleteStudent(data.id!);
                      // } else {
                      //   print('student id is null, unable to delelte');
                      // }
                    }),
                    icon: const Icon(
                      Icons.edit,
                      color: Colors.green,
                    ),
                    tooltip: 'Edit',
                  ),
                  IconButton(
                    onPressed: (() {
                      showDialog(
                        context: context,
                        builder: ((context) {
                          return Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: AlertDialog(
                              title: const Text(
                                'Alert!',
                                style: TextStyle(
                                  color: Colors.red,
                                ),
                              ),
                              content: const Text(
                                "YOU WANT TO DELETE THIS STUDENT",
                              ),
                              actions: [
                                TextButton(
                                  onPressed: (() {
                                  //  popoutfuction(context); 
                                    // deletestudent(index);
                                    Provider.of<StudentAddProvider>(context, listen: false).deletestudent(index);
                                    Navigator.pop(context);
                                  }),
                                  child: const Text('Yes'),
                                ),
                                TextButton(
                                    onPressed: (() {
                                      // popoutfuction(context);
                                      Navigator.pop(context);
                                    }),
                                    child: const Text('No'))
                              ],
                            ),
                          );
                        }),
                      );
                    }),
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                    tooltip: 'delete',
                  ),
                ],
              ),
          leading: CircleAvatar(
            radius: 30,
            backgroundImage: FileImage(
              
              File(studentlist[index].photo ),
            ),
          
          ),
        );
      },
      separatorBuilder: (ctx, index){
        return const Divider();
      },
      itemCount: studentlist.length,
        ),
    );
  }
}