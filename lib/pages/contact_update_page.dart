// ignore_for_file: prefer_const_constructors

import 'package:blocmocfile/bloc/create_contact_cubit.dart';
import 'package:blocmocfile/bloc/create_contact_state.dart';
import 'package:blocmocfile/model/contactModel.dart';
import 'package:blocmocfile/widgets/create_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Update extends StatefulWidget {
  const Update({ Key? key, required this.contact }) : super(key: key);
  final Contacts contact;
  @override
  State<Update> createState() => _UpdateState();
}

class _UpdateState extends State<Update> {

  bool isloading = false;
  final namecontroller = TextEditingController();
  final phonecontroller = TextEditingController();
  

   finish(BuildContext context){
    SchedulerBinding.instance?.addPostFrameCallback((timeStamp) { 
      Navigator.pop(context,"result");
    });
  }
  
  @override
  Widget build(BuildContext context) {

    namecontroller.text = widget.contact.fullName;
    phonecontroller.text = widget.contact.phone;
    return BlocProvider(
      create: (context) => CreateContactCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Update Contact"),
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