import 'package:image_picker/image_picker.dart';

class ImagePickerUtils {
  final ImagePicker _pickImage = ImagePicker();

  Future<XFile?> cameraPicker() async {
    final XFile? file = await _pickImage.pickImage(source: ImageSource.camera);
    return file;
  }

  Future<XFile?> galleryPicker() async {
    final XFile? file = await _pickImage.pickImage(source: ImageSource.gallery);
    return file;
  }
}
