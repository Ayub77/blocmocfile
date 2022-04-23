import 'package:blocmocfile/bloc/create_contact_state.dart';
import 'package:blocmocfile/model/contactModel.dart';
import 'package:blocmocfile/service/network.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateContactCubit extends Cubit<CreateContactState>{
  CreateContactCubit() : super(CreateContactInit());

void apiContactCreate(Contacts contact)async{
   emit(CreateContactLoading());
    var respons = await Network.POST(Network.API_CREATE, Network.paramsCreate(contact));
    if(respons != null){
       emit(CreateContactLoaded(isCreated: true));
    }else{
      emit(CreateContactError(error: "Couldn't fetch posts"));
    }
 }

 
}