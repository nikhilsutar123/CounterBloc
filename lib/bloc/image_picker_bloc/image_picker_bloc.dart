import 'package:counter_bloc/bloc/image_picker_bloc/image_picker_event.dart';
import 'package:counter_bloc/bloc/image_picker_bloc/image_picker_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../utils/image_picker.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerState> {
  final ImagePickerUtils imagePickerUtils;

  ImagePickerBloc(this.imagePickerUtils) : super(const ImagePickerState()) {
    on<UploadImageFromCameraEvent>(_pickImageFromCamera);
    on<UploadImageFromGalleryEvent>(_pickImageFromGallery);
  }

  void _pickImageFromCamera(
      UploadImageFromCameraEvent event, Emitter<ImagePickerState> emit) async {
    XFile? file = await imagePickerUtils.pickImgFromCamera();
    emit(state.copyWith(file: file));
  }

  void _pickImageFromGallery(UploadImageFromGalleryEvent event,
      Emitter<ImagePickerState> emit) async {
    XFile? file = await imagePickerUtils.pickImgFromGallery();
    emit(state.copyWith(file: file));
  }
}
