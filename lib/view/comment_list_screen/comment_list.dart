import 'package:counter_bloc/bloc/api_demo_bloc/comment_api_event.dart';
import 'package:counter_bloc/bloc/api_demo_bloc/comment_bloc.dart';
import 'package:counter_bloc/bloc/api_demo_bloc/comment_state.dart';
import 'package:counter_bloc/utils/post_status_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommentList extends StatefulWidget {
  const CommentList({super.key});

  @override
  State<CommentList> createState() => _CommentListState();
}

class _CommentListState extends State<CommentList> {
  @override
  void initState() {
    super.initState();
    //context.read<CommentBloc>().add(CommentFetchedEvent());
    context.read<CommentBloc>().add(TxnFetchedEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child:
              BlocBuilder<CommentBloc, CommentState>(builder: (context, state) {
            switch (state.status) {
              case ApiStatus.loading:
                return const CircularProgressIndicator();
              case ApiStatus.success:
                return ListView.builder(
                    itemCount: state.txndetails.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          state.txndetails[index].name.toString(),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        trailing: Text(
                          "₹${state.txndetails[index].amount.toString()}",
                          style: TextStyle(fontSize: 14),
                        ),
                        subtitle: Text(
                          state.txndetails[index].upi.toString(),
                          style: const TextStyle(
                              overflow: TextOverflow.ellipsis, fontSize: 10),
                        ),
                      );
                    });
              case ApiStatus.failure:
                return Text(state.msg.toString());
            }
          }),
        ),
      ),
    );
  }
}
