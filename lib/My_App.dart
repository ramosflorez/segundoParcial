import 'package:flutter/material.dart';
import 'package:segundoparcial/pages/home_page.dart';

class MyApp extends StatelessWidget{
  const MyApp ({Key? key}) :super(key:key);

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "NASA",
      theme: ThemeData.dark(
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/':(context)=>MyHomeApp(title: "NASA",)
      },
    );
  }
}