// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:blocmocfile/bloc/create_contact_cubit.dart';
import 'package:blocmocfile/bloc/create_contact_state.dart';
import 'package:blocmocfile/widgets/create_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Create extends StatefulWidget {
  const Create({Key? key}) : super(key: key);

  @override
  State<Create> createState() => _CreateState();
}

class _CreateState extends State<Create> {
  
  finish(BuildContext context){
    SchedulerBinding.instance?.addPostFrameCallback((timeStamp) { 
      Navigator.pop(context,"result");
    });
  }


  bool isloading = false;
  final namecontroller = TextEditingController();
  final phonecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateContactCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Add Contact"),
          centerTitle: true,
        ),
        body: BlocBuilder<CreateContactCubit,CreateContactState>(
            builder: (BuildContext context,CreateContactState state){
              if(state is CreateContactLoading){
                return CreateWidget(namecontroller: namecontroller,phonecontroller: phonecontroller,isloading: isloading,);
              }
              if(state is CreateContactLoaded){
                finish(context);
              }
              if(state is CreateContactError){

              }
             return CreateWidget(namecontroller: namecontroller,phonecontroller: phonecontroller,isloading: isloading); 
            },
            
      ),
    )
    );
  }
}
