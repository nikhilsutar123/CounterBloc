import 'package:counter_bloc/bloc/counter_bloc/counter_bloc.dart';
import 'package:counter_bloc/bloc/image_picker_bloc/image_picker_bloc.dart';
import 'package:counter_bloc/bloc/switch_bloc/switch_bloc.dart';
import 'package:counter_bloc/bloc/switch_bloc/switch_state.dart';
import 'package:counter_bloc/bloc/todo/todo_bloc.dart';
import 'package:counter_bloc/utils/image_picker.dart';
import 'package:counter_bloc/view/comment_list_screen/comment_list.dart';
import 'package:counter_bloc/view/counter/counter_screen.dart';
import 'package:counter_bloc/view/image_screen/image_picker_screen.dart';
import 'package:counter_bloc/view/switch/switch_screen.dart';
import 'package:counter_bloc/view/todo_screen/todo_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/api_demo_bloc/comment_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CounterBloc()),
        BlocProvider(create: (_) => SwitchBloc()),
        BlocProvider(create: (_) => ImagePickerBloc(ImagePickerUtils())),
        BlocProvider(create: (_) => TodoBloc()),
        BlocProvider(create: (_) => CommentBloc()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const CommentList(),
      ),
    );
  }
}
