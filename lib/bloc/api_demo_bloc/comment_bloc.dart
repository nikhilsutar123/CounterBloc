import 'package:bloc/bloc.dart';
import 'package:counter_bloc/bloc/api_demo_bloc/comment_api_event.dart';
import 'package:counter_bloc/bloc/api_demo_bloc/comment_state.dart';
import 'package:counter_bloc/utils/post_status_enum.dart';
import '../../repository/comment_repository.dart';

class CommentBloc extends Bloc<CommentApiEvent, CommentState> {
  CommentRepository repository = CommentRepository();

  CommentBloc() : super(const CommentState()) {
    on<CommentFetchedEvent>(_getComments);
    on<TxnFetchedEvent>(_getTxns);
  }

  void _getComments(
      CommentFetchedEvent event, Emitter<CommentState> emit) async {
    await repository.getCommentsApi().then((value) {
      emit(state.copyWith(
          status: ApiStatus.success, comments: value, msg: "success!"));
    }).onError((error, stacktrace) {
      print(stacktrace);
      emit(state.copyWith(status: ApiStatus.failure, msg: "failure!"));
    });
  }

  void _getTxns(TxnFetchedEvent event, Emitter<CommentState> emit) async {
    await repository.getTxnApi().then((value) {
      emit(state.copyWith(
          status: ApiStatus.success, txns: value, msg: "success!"));
    }).onError((error, stacktrace) {
      print(stacktrace);
      emit(state.copyWith(status: ApiStatus.failure, msg: "failure!"));
    });
  }
}
