part of 'bloc.dart';

abstract class SendCommentsEvent {}
class StartSendCommentEvent extends SendCommentsEvent{
 final  String comment ;

  StartSendCommentEvent(this.comment);
}