import 'dart:io';

import 'package:flutter/material.dart';





import 'package:student_list_add/presentation/list_student.dart';


import 'detial.dart';
import 'provider/add_student_provider.dart';


class SearchWidget extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    
        return ListView.builder(
          itemBuilder: (ctx, index) {
            final data = studentlist[index];
            if (data.name.trim().contains(
                  query.trim(),
                )) {
              return Column(
                children: [
                  ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) {
                            return Liststudents() ;
                          }),
                        ),
                      );
                    },
                    title: Text(data.name),
                    leading: CircleAvatar(
                      backgroundImage: FileImage(File(data.photo)),
                    ),
                  ),
                  const Divider()
                ],
              );
            } else {
              return Container();
            }
          },
          itemCount: studentlist.length,
        );
      }
    
  
  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
  @override
  Widget buildSuggestions(BuildContext context) {
   
        return ListView.builder(
          itemBuilder: (ctx, index) {
            final data = studentlist[index];
            
            if (data.name.toLowerCase().contains(
              
                  query.toLowerCase().trim() ,
                )|| data.name.toUpperCase().contains(query.trim())) {
              return Column(
                children: [
                  ListTile(
                    onTap: () {
                      Navigator.of(context).push(   
                        MaterialPageRoute(
                          builder: ((context) {
                            return StudentDetails(name: data.name, age: data.age, phonenumber:data. phonenumber, place: data.place, photo: data.photo);
                          }),
                        ),
                      );
                    },
                    title: Text(data.name),
                    leading: CircleAvatar(
                      backgroundImage: FileImage(File(data.photo)),
                    ),
                  ),
                  const Divider()
                ],
              );
            } else {
              return Container();
            }
          },
          itemCount: studentlist.length,
        );
      }
    

  }

  


  
