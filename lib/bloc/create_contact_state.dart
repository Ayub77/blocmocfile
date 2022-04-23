// ignore_for_file: prefer_typing_uninitialized_variables
import 'package:equatable/equatable.dart';

abstract class CreateContactState extends Equatable{
   @override
  List<Object> get props => [];
}
class CreateContactInit extends CreateContactState{}

class CreateContactLoading extends CreateContactState {}

class CreateContactLoaded extends CreateContactState {
  late final bool isCreated;
  CreateContactLoaded({required this.isCreated});
}

class CreateContactError extends CreateContactState {
 late final  error;
 CreateContactError({this.error});
}