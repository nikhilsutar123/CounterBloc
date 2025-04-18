import 'package:equatable/equatable.dart';

abstract class CommentApiEvent extends Equatable{

  @override
  List<Object?> get props => throw UnimplementedError();
}

class CommentFetchedEvent extends CommentApiEvent{}

class TxnFetchedEvent extends CommentApiEvent{}