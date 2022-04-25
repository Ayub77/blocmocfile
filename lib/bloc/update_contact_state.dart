// ignore_for_file: prefer_typing_uninitialized_variables
import 'package:equatable/equatable.dart';

abstract class UpdateContactState extends Equatable{
   @override
  List<Object> get props => [];
}
class UpdateContactInit extends UpdateContactState{}

class UpdateContactLoading extends UpdateContactState {}

class UpdateContactLoaded extends UpdateContactState {
  late final bool isUpdated;
  UpdateContactLoaded({required this.isUpdated});
}

class UpdateContactError extends UpdateContactState {
 late final  error;
 UpdateContactError({this.error});
}