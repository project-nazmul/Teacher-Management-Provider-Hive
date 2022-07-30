import 'package:flutter/material.dart';
import 'package:list_map_crud/model/teacher.dart';
import 'package:list_map_crud/widget/edit_teacher.dart';
import 'package:provider/provider.dart';

class CustomTile extends StatelessWidget {
  const CustomTile({Key? key,required this.index}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    final myProvide = Provider.of<Teacher>(context,listen: true);
    return Card(
      margin: const EdgeInsets.all(10),
      elevation: 10,
      child: ListTile(
        tileColor: Colors.blue[100],
        leading: CircleAvatar(
          backgroundColor: Colors.blue[200],
            child: Text(
              myProvide.teachers.getAt(index)["name"][0],
            )),
        title: Text(myProvide.teachers.getAt(index)["name"]),
        subtitle: Text(myProvide.teachers.getAt(index)["email"]),
        trailing: FittedBox(
          child: Row(
            children: [
              EditTeacher(index: index,),
              IconButton(
                  onPressed: () {
                    myProvide.deleteData(index);
                  },
                  icon: const Icon(Icons.delete)),
            ],
          ),
        ),
      ),
    );
  }
}
