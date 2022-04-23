// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:blocmocfile/bloc/list_contact_cubit.dart';
import 'package:blocmocfile/pages/homePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiBlocProvider(
        providers:[
           BlocProvider(create: (context)=>ListContactCubit())
        ] ,
         child: const HomePage()),
    );
  }
}

