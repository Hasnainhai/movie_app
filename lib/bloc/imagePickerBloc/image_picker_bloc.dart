import 'package:bloc_movie_app/bloc/imagePickerBloc/image_picker_event.dart';
import 'package:bloc_movie_app/bloc/imagePickerBloc/image_picker_state.dart';
import 'package:bloc_movie_app/utils/image_picker_utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerState> {
  ImagePickerUtils imagePickerUtils = ImagePickerUtils();

  ImagePickerBloc(this.imagePickerUtils) : super(const ImagePickerState()) {
    on<CameraPicker>(cameraCapture);
    on<GalleryPicker>(galleryPicker);
  }
  void cameraCapture(CameraPicker event, Emitter<ImagePickerState> emit) async {
    XFile? file = await imagePickerUtils.cameraPicker();
    emit(state.copyWith(file: file));
  }

  void galleryPicker(
      GalleryPicker event, Emitter<ImagePickerState> emit) async {
    XFile? file = await imagePickerUtils.galleryPicker();
    emit(state.copyWith(file: file));
  }
}
