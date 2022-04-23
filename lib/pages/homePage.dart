// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:blocmocfile/bloc/list_contact_cubit.dart';
import 'package:blocmocfile/bloc/list_contacts_state.dart';
import 'package:blocmocfile/model/contactModel.dart';
import 'package:blocmocfile/widgets/contact_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Contacts> items = [];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<ListContactCubit>(context).apiPostList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("bloc"),
        centerTitle: true,
      ),
      body: BlocBuilder<ListContactCubit,ListContactState>(
        builder: (BuildContext context,ListContactState state ){
              if(state is ListContactError){
                return Container();
              }
              if(state is ListContactLoaded){
                return Stack(
        children: [
          ListView.builder(
            itemCount: state.contacts.length,
            itemBuilder:(context,index){
              return itemOfContact(contact: state.contacts[index]);
            } ),
        ],
      );
              }
         return Center(child: CircularProgressIndicator(),);     
        }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        onPressed: (){
           BlocProvider.of<ListContactCubit>(context).callCreatePage(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }
 
}

