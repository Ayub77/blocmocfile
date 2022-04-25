
import 'package:blocmocfile/bloc/update_contact_state.dart';
import 'package:blocmocfile/model/contactModel.dart';
import 'package:blocmocfile/service/network.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateContactCubit extends Cubit<UpdateContactState>{
  UpdateContactCubit() : super(UpdateContactInit());

void apiContactUpdate(Contacts contact)async{
  contact.id = "1";
   emit(UpdateContactLoading());
    var respons = await Network.POST(Network.API_UPDATE+ contact.id, Network.paramsCreate(contact));
    if(respons != null){
       emit(UpdateContactLoaded(isUpdated: true));
    }else{
      emit(UpdateContactError(error: "Couldn't fetch posts"));
    }
 }

 
}