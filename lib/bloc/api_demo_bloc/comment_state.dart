import 'package:counter_bloc/utils/post_status_enum.dart';
import 'package:equatable/equatable.dart';

import '../../data/comment_model.dart';
import '../../data/txn_model.dart';

class CommentState extends Equatable {
  final ApiStatus status;
  final List<Comment> comments;
  final List<TxnDetails> txndetails;
  final String msg;

  const CommentState(
      {this.status = ApiStatus.loading,
      this.comments = const <Comment>[],
      this.txndetails = const <TxnDetails>[],
      this.msg = ''});

  CommentState copyWith(
      {ApiStatus? status,
      List<Comment>? comments,
      List<TxnDetails>? txns,
      String? msg}) {
    return CommentState(
        status: status ?? this.status,
        comments: comments ?? this.comments,
        txndetails: txns ?? txndetails,
        msg: msg ?? this.msg);
  }

  @override
  List<Object?> get props => [status, comments, txndetails, msg];
}
