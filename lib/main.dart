import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testprovider/providers/task_provider.dart';
import 'package:testprovider/screens/task_list_screen.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => TaskProvider()),
  ],
  child: MyApp(),),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'To-Do App With Provider',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: TaskListScreen(),
    );
  }
}
