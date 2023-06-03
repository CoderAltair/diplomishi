part of 'bloc.dart';

abstract class SendCommentsState {}

class SendCommentsInitial extends SendCommentsState {}

class SendCommentsSuccesState extends SendCommentsState {}

class SendCommentsFailureState extends SendCommentsState {}

class SendCommentsProcces extends SendCommentsState {}
