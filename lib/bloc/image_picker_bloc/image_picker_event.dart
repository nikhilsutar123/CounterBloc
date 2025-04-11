import 'package:equatable/equatable.dart';

class ImagePickerEvent extends Equatable {
  const ImagePickerEvent();
  @override
  List<Object?> get props => [];
}

class UploadImageFromCameraEvent extends ImagePickerEvent {}

class UploadImageFromGalleryEvent extends ImagePickerEvent {}
