import 'dart:io';

import 'package:counter_bloc/bloc/image_picker_bloc/image_picker_bloc.dart';
import 'package:counter_bloc/bloc/image_picker_bloc/image_picker_event.dart';
import 'package:counter_bloc/bloc/image_picker_bloc/image_picker_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImagePickerScreen extends StatefulWidget {
  const ImagePickerScreen({super.key});

  @override
  State<ImagePickerScreen> createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: BlocBuilder<ImagePickerBloc, ImagePickerState>(
            builder: (context, state) {
              if (state.file == null) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {
                          context
                              .read<ImagePickerBloc>()
                              .add(UploadImageFromCameraEvent());
                        },
                        icon: const Icon(Icons.camera_alt)),
                    const SizedBox(
                      height: 10,
                    ),
                    IconButton(
                        onPressed: () {
                          context
                              .read<ImagePickerBloc>()
                              .add(UploadImageFromGalleryEvent());
                        },
                        icon: const Icon(Icons.image))
                  ],
                );
              } else {
                return Image.file(File(state.file!.path.toString()));
              }
            },
          ),
        ),
      ),
    );
  }
}
