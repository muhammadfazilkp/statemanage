import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:student_list_add/model.dart';

import '../provider/add_student_provider.dart';

class AddStudent extends StatelessWidget {
  const  AddStudent({super.key});

  @override
  Widget build(BuildContext context) {
    // final studentAddProvider =Provider.of<StudentAddProvider>(context,listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[200],
        title: const Text('Add student'),
      ),
      body: Consumer<StudentAddProvider>(
        builder: (context, providerModel, _) => Padding(
            padding: const EdgeInsets.all(30.0),
            child: SingleChildScrollView(
                child: Form(
              key: providerModel.formkey,
              child: Column(
                children: [
                  CircleAvatar(
                      radius: 80,
                      backgroundImage: providerModel.fileImage != null
                          ? FileImage(File(
                              providerModel.fileImage!.path,
                            ))
                          : const NetworkImage(
                                  'https://imgs.search.brave.com/tzo0A3R4UohUphhu1vXYNx3h_ZRhljxoxkme33POotA/rs:fit:264:225:1/g:ce/aHR0cHM6Ly90c2Ux/LmV4cGxpY2l0LmJp/bmcubmV0L3RoP2lk/PU9JUC5HWnk1YzRD/Qk92TFhQTUVSRVQx/WU53QUFBQSZwaWQ9/QXBp')
                              as ImageProvider),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          providerModel.getphoto();
                        },
                        icon: const Icon(Icons.image_outlined),
                        label: const Text('Add an image'),
                      )
                    ],
                  ),
                  TextFormField(
                    controller: providerModel.namecontroller,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter Name',
                        labelText: 'Username'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'please enter some text';
                      } else {
                        return null;
                      }
                    }, 
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: providerModel.ageController,
                    maxLength: 2,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter Age',
                        labelText: 'Age'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'please enter some text';
                      }
                      return null;
                      //changed this null 4th june
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: providerModel.phonecontroller,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter phonenumber',
                        labelText: 'Phonenumber'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'please enter some text';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: providerModel.placeController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter Place',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'please enter some text';
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (providerModel.formkey.currentState!.validate()) {
                          onAddstudentbuttonclicked(
                            context,
                            providerModel.namecontroller,
                            providerModel.ageController,
                            providerModel.phonecontroller,
                            providerModel.placeController,
                          );
                          Navigator.pop(context);
                        }
                      },
                      child: const Text('Add'))
                ],
              ),
            ))),
      ),
    );
  }

  Future<void> onAddstudentbuttonclicked(
    context,
    TextEditingController nameController,
    TextEditingController ageController,
    TextEditingController phoneController,
    TextEditingController placeController,
  ) async {
    final name = nameController.text.trim();
    final age = ageController.text.trim();
    final phonenumber = phoneController.text.trim();
    final place = placeController.text.trim();

    if (name.isEmpty ||
        age.isEmpty ||
        phonenumber.isEmpty ||
        place.isEmpty ||
        Provider.of<StudentAddProvider>(context, listen: false)
            .fileImage!
            .path
            .isEmpty) {
      return;
    }
    // stdout.write('$name $age $phonenumber $place');
    final student = studentmodel(
      name: name,
      age: age,
      phonenumber: phonenumber,
      place: place,
      photo: Provider.of<StudentAddProvider>(context, listen: false)
          .fileImage!
          .path,
      //namecontroller: fullname
    );
    Provider.of<StudentAddProvider>(context, listen: false).addstudent(student);
  }
}
