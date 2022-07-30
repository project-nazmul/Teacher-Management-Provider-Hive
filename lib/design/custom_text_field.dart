import 'package:flutter/material.dart';
import 'package:list_map_crud/model/teacher.dart';
import 'package:provider/provider.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({Key? key,required this.icon,required this.name}) : super(key: key);
  final IconData icon;
  final String name;
  @override
  Widget build(BuildContext context) {
    final myProvide = Provider.of<Teacher>(context,listen: true);
    return TextFormField(
      decoration: InputDecoration(
        icon: Icon(icon),
        label: Text(name),
      ),
      controller: name=='Name'?myProvide.nameController:myProvide.emailController,
    );
  }
}
