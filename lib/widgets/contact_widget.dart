// ignore_for_file: prefer_const_constructors

import 'package:blocmocfile/bloc/list_contact_cubit.dart';
import 'package:blocmocfile/model/contactModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class itemOfContact extends StatelessWidget {
  const itemOfContact({Key? key, required this.contact,}) : super(key: key);
  final Contacts contact;
  @override
  Widget build(BuildContext context) {
    return Slidable(
      direction: Axis.horizontal,
      startActionPane: ActionPane(
      extentRatio: 0.25,
      motion: const ScrollMotion(),
      children: [
        SlidableAction(
          onPressed: (value){
          // Navigator.of(context).push(MaterialPageRoute(builder: (context) => UpdateAndAdd(title: "Update",id: post.id.toString(),))).then((value){
          //    if(value){
           
          //    }
          //  });
          },
         backgroundColor: Colors.indigo,
         icon: Icons.edit,
         label: "Update", 
          )
      ],),
      endActionPane: ActionPane(
      extentRatio: 0.25,
      motion: const ScrollMotion(),
      children: [
        SlidableAction(
          onPressed: (value){
             BlocProvider.of<ListContactCubit>(context).apiPostDelete(contact); 
          },
         backgroundColor: Colors.red,
         icon: Icons.delete,
         label: "delete", 
          )
      ],),
      child:Container(
        height: 70,
        alignment: Alignment.topLeft,
      padding: EdgeInsets.only(top: 20,left: 20,right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Text(contact.fullName.toUpperCase(),style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
          SizedBox(height: 5,),
          Text(contact.phone)
        ],
      ),
    ) );
  }
}