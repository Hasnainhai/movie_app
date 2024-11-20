import 'dart:io';

import 'package:bloc_movie_app/bloc/imagePickerBloc/image_picker_bloc.dart';
import 'package:bloc_movie_app/bloc/imagePickerBloc/image_picker_event.dart';
import 'package:bloc_movie_app/bloc/imagePickerBloc/image_picker_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImagePickerScreen extends StatelessWidget {
  const ImagePickerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Picker'),
        centerTitle: true,
      ),
      body: Center(
        child: BlocBuilder<ImagePickerBloc, ImagePickerState>(
            builder: (contex, state) {
          return state.file == null
              ? IconButton(
                  onPressed: () {
                    context.read<ImagePickerBloc>().add(GalleryPicker());
                  },
                  icon: const Icon(Icons.camera))
              : Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: FileImage(File(state.file!.path.toString()))),
                  ),
                );
        }),
      ),
    );
  }
}
