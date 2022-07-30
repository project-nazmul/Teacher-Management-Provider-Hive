import 'package:flutter/material.dart';
import 'package:list_map_crud/model/teacher.dart';
import 'package:list_map_crud/widget/add_teacher.dart';
import 'package:list_map_crud/widget/custom_tile.dart';
import 'package:provider/provider.dart';


class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final myProvide = Provider.of<Teacher>(context,listen: true);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[200],
        title: const Text('Teacher Info'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: myProvide.teachers.length,
        itemBuilder: (context, index) {
          return CustomTile(index: index);
        },
      ),
      floatingActionButton: const AddTeacher(),
    );
  }
}

