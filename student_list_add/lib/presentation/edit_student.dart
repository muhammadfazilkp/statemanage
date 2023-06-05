import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:student_list_add/model.dart';

import '../provider/add_student_provider.dart';

class EditStudent extends StatelessWidget {
  final String age;
  final String name;
  final String phonenumber;
  final String place;
  final String photo;
  final int index;

  EditStudent({
    super.key,
    required this.name,
    required this.age,
    required this.phonenumber,
    required this.place,
    required this.photo,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit'),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Consumer<StudentAddProvider>(
              builder: (context, providerModel, child) {
            providerModel.placeController = TextEditingController(text: age);
            providerModel.namecontroller =
                TextEditingController(text: phonenumber);
            providerModel.ageController = TextEditingController(text: place);
            providerModel.fullnameController =
                TextEditingController(text: photo);

            return Column(
              children: [
                const Text(
                  'Edit student details',
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 20,
                ),
                CircleAvatar(
                    radius: 80,
                    backgroundImage: providerModel.fileImage == null
                        ? FileImage(
                            File(photo),
                          )
                        : FileImage(File(providerModel.fileImage!.path))),
                ElevatedButton.icon(
                  onPressed: () {
                    providerModel.getphoto();
                  },
                  icon: const Icon(Icons.image_outlined),
                  label: const Text('Edit image'),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: providerModel.editName,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter your Name ',
                    labelText: 'Name',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Required Name';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: providerModel.editAge,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter your Age',
                    labelText: 'Age',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Required Age';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  maxLength: 10,
                  controller: providerModel.editPhone,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter your phone Number',
                    labelText: 'ph NUM',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Required Number';
                    } else if (value.length < 10) {
                      return 'invalid number';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: providerModel.editPlace,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter your Adderss',
                    labelText: 'Address',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Required Adderss';
                    } else {
                      return null;
                    }
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        if (providerModel.edittFomkey.currentState!
                            .validate()) {
                          onEditSaveButton(
                            context,
                            index: index,
                            name: providerModel.editName,
                            age: providerModel.editAge,
                            place: providerModel.editPlace,
                            photo: providerModel.fileImage?.path ?? photo,
                            phone: providerModel.editPhone,
                          );
                        }
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(Icons.check),
                      label: const Text('save'),
                    ),
                  ],
                )
              ],
            );
          }),
        ),
      )),
    );
  }

  Future<void> onEditSaveButton(ctx,
      {required index,
      required TextEditingController name,
      required TextEditingController age,
      required TextEditingController place,
      required photo,
      required TextEditingController phone}) async {
    final studentModel = studentmodel(
      name: name.text,
      age: age.text,
      phonenumber: phone.text,
      place: place.text,
      photo: photo,
    );
    ScaffoldMessenger.of(ctx).showSnackBar(
      const SnackBar(
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.all(30),
        backgroundColor: Colors.blueGrey,
        content: Text(
          'SAVED',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
    Provider.of<StudentAddProvider>(ctx, listen: false)
        .editstudent(index, studentModel);
  }

//  File? _photo;
// Future<void>getphoto()async{
//   final photo= await ImagePicker().pickImage(source: ImageSource.gallery);
//   if(photo==null){
//     return;

//   }else{
//     final phototemp=File(photo.path);
//     setState(() {
//       _photo=phototemp;
//     });
//   }

// }
}
