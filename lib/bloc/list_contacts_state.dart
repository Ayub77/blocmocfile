// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:blocmocfile/model/contactModel.dart';
import 'package:equatable/equatable.dart';

abstract class ListContactState extends Equatable{
   @override
  List<Object> get props => [];
}
class ListContactInit extends ListContactState{}

class ListContactLoading extends ListContactState {}

class ListContactLoaded extends ListContactState {
  late final List<Contacts> contacts;
  late final bool isDeleted;
  ListContactLoaded({required this.contacts,required this.isDeleted});
}

class ListContactError extends ListContactState {
 late final  error;
 ListContactError({this.error});
}