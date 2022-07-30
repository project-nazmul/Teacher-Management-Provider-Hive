import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Teacher extends ChangeNotifier{

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();


  Box teachers = Hive.box('Database');


  addData(String n,String e){
    teachers.add(
        {'name':n,'email':e}
    );
    notifyListeners();
  }
  updateData(int i,String n,String e){
    teachers.putAt(i, {'name':n,'email':e});
    notifyListeners();
  }
  deleteData(int i){
    teachers.deleteAt(i);
    notifyListeners();
  }

}