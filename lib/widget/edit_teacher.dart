import 'package:flutter/material.dart';
import 'package:list_map_crud/design/custom_text_field.dart';
import 'package:list_map_crud/model/teacher.dart';
import 'package:provider/provider.dart';

class EditTeacher extends StatelessWidget {
  const EditTeacher({Key? key,required this.index}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    final myProvide = Provider.of<Teacher>(context,listen: true);
    return IconButton(
        onPressed: () {
          myProvide.nameController.text = myProvide.teachers.getAt(index)["name"];
          myProvide.emailController.text = myProvide.teachers.getAt(index)["email"];
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                actions: [
                  ElevatedButton(
                      onPressed: () {
                        myProvide.updateData(index, myProvide.nameController.text, myProvide.emailController.text);
                        myProvide.nameController.clear();
                        myProvide.emailController.clear();
                        Navigator.pop(context);
                      },
                      child: const Text('Submit'))
                ],
                title:const Text('EDIT Teacher INFO') ,
                content:Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Form(
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            children: const [
                              CustomTextField(icon: Icons.account_box, name: 'Name'),
                              CustomTextField(icon: Icons.email, name: 'Email'),
                            ],
                          ),
                        )),

                  ],
                ) ,
              );
            },
          );
        },
        icon: const Icon(Icons.edit));
  }
}
