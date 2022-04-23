// ignore_for_file: prefer_const_constructors

import 'package:blocmocfile/bloc/create_contact_cubit.dart';
import 'package:blocmocfile/model/contactModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateWidget extends StatelessWidget {
  const CreateWidget({
    Key? key,
    required this.namecontroller,
    required this.phonecontroller,
    required this.isloading 
  }) : super(key: key);

  final TextEditingController namecontroller;
  final TextEditingController phonecontroller;
  final bool isloading;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              TextField(
                controller: namecontroller,
                decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                    labelText: "fullname",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.green, width: 1))),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: phonecontroller,
                decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                    labelText: "phone",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.green, width: 1))),
              ),
              SizedBox(
                height: 20,
              ),
              FlatButton(
                onPressed: () {
                  
                  Contacts contact = Contacts(id: '11', fullName: namecontroller.text, phone: phonecontroller.text);
                  BlocProvider.of<CreateContactCubit>(context).apiContactCreate(contact);
                },
                child: Text("Ok"),
                color: Colors.blue,
              )
            ],
          ),
        ),
        isloading?Center(child: CircularProgressIndicator(),):SizedBox.shrink()
      ],
    );
  }
}
