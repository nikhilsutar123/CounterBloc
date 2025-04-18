import 'dart:convert';
import 'dart:io';
import 'package:counter_bloc/data/txn_model.dart';
import 'package:http/http.dart' as http;
import 'package:counter_bloc/data/comment_model.dart';

import '../utils/constant.dart';

class CommentRepository {
  Future<List<Comment>> getCommentsApi() async {
    try {
      var response = await http.get(Uri.parse(Constant.commentApi));
      if (response.statusCode == 200) {
        List<dynamic> list = jsonDecode(response.body);
        List<Comment> comments =
            list.map((json) => Comment.fromJson(json)).toList();
        return comments;
      } else {
        return [];
      }
    } on SocketException {
      throw Exception("Error while fetching comments...");
    }
  }

  Future<List<TxnDetails>> getTxnApi() async {
    try {
      var response = await http.get(Uri.parse(Constant.txnApi));
      if (response.statusCode == 200) {
        List<dynamic> list = jsonDecode(response.body);
        List<TxnDetails> txn =
            list.map((json) => TxnDetails.fromJson(json)).toList();
        return txn;
      } else {
        return [];
      }
    } on SocketException {
      throw Exception("Error while fetching comments...");
    }
  }
}
