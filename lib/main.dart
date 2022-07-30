import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:list_map_crud/model/teacher.dart';
import 'package:list_map_crud/my_home_page.dart';
import 'package:provider/provider.dart';

void main() async{
  await Hive.initFlutter();
  await Hive.openBox('Database');
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Teacher(),)
      ],
  child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CRUD',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

