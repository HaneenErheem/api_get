import 'package:api_android/screens/launch_screen.dart';
import 'package:api_android/screens/users_screen.dart';
import 'package:flutter/material.dart';
void main()=>runApp(MyApp());
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      initialRoute:'/launch_screen' ,
      routes: {
        '/launch_screen':  (context) => const LaunchScreen(),
        '/users_screen':(context)=>const UsersScreen(),
      },
    );
  }
}