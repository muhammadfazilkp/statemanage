import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student_list_add/model.dart';
 final List<studentmodel> studentlist = [];
class StudentAddProvider extends ChangeNotifier {
   File? photo;

  TextEditingController namecontroller = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController placeController = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController fullnameController = TextEditingController();
  //  TextEditingController photoController=TextEditingController();

  final formkey = GlobalKey<FormState>();

  TextEditingController editName = TextEditingController();
  TextEditingController editAge = TextEditingController();
  TextEditingController editPhone = TextEditingController();
  TextEditingController editPlace = TextEditingController();
  final edittFomkey = GlobalKey<FormState>();

  File? fileImage;
  Future<void> getphoto() async {
    final photo = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (photo == null) {
      return;
    } else {
      final phototemp = File(photo.path);

      fileImage = phototemp;
    }
    notifyListeners();
  }

  Future<void> addstudent(studentmodel value) async {
// studentListNotifier.value.add(value);
    final studentDB = await Hive.openBox<studentmodel>('student_db');
    await studentDB.add(value);
    studentlist.add(value);
    getAllStudents();

    notifyListeners();
  }

  // List<studentmodel> foundeduser = [];
  Future<void> getAllStudents() async {
    final studentDB = await Hive.openBox<studentmodel>('student_db');
    studentlist.clear();
    studentlist.addAll(studentDB.values);
    // foundeduser = studentlist;
    notifyListeners();
  }

  Future<void> deletestudent(int index) async {
    final studentDB = await Hive.openBox<studentmodel>('student_db');
    await studentDB.deleteAt(index);
    getAllStudents();
    notifyListeners();
  }

  Future<void> editstudent(int index, studentmodel value) async {
    final studentDB = await Hive.openBox<studentmodel>('student_db');
    await studentDB.putAt(index, value);
    getAllStudents();
    notifyListeners();
  }
    

}
