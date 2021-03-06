import 'package:blocmocfile/bloc/list_contacts_state.dart';
import 'package:blocmocfile/model/contactModel.dart';
import 'package:blocmocfile/pages/contact_create.dart';
import 'package:blocmocfile/pages/contact_update_page.dart';
import 'package:blocmocfile/service/network.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListContactCubit extends Cubit<ListContactState>{
  ListContactCubit() : super(ListContactInit());

void apiPostList()async{
   emit(ListContactLoading());
    var respons = await Network.GET(Network.API_LIST, Network.paramsEmpty());
    if(respons != null){
      emit(ListContactLoaded(contacts: Network.parsePostList(respons), isDeleted: false));
    }else{
      emit(ListContactError(error: "Couldn't fetch posts"));
    }
 }

 void apiPostDelete(Contacts contact) async {
   emit(ListContactLoading());
   final respons = await Network.DEL(Network.API_DELETE+contact.id.toString(), Network.paramsEmpty());
   if(respons!=null){
      apiPostList();
   }else{
     emit(ListContactError(error:"error"));
   }
 }

 void callCreatePage(BuildContext context)async{
   var result = await  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Create()));
   if(result != null){
     BlocProvider.of<ListContactCubit>(context).apiPostList();
   }
}

void callUpdatePage(BuildContext context,Contacts contact)async{
   var result = await  Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  Update(contact: contact,)));
   if(result != null){
     BlocProvider.of<ListContactCubit>(context).apiPostList();
   }  
 
 }
}