import 'package:blocmocfile/bloc/list_contacts_state.dart';
import 'package:blocmocfile/model/contactModel.dart';
import 'package:blocmocfile/service/network.dart';
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

}