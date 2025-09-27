import 'package:image_picker/image_picker.dart';

class ImagePickerHelper {
  static final ImagePicker _picker = ImagePicker();

  /// Повертає шлях до картинки або null
  static Future<String?> pickImagePath(ImageSource source) async {
    final XFile? pickedFile = await _picker.pickImage(source: source);
    return pickedFile?.path;
  }

  /// Додатково можна зробити метод з вибором камери/галереї
  static Future<String?> pickImageFromGallery() async {
    return pickImagePath(ImageSource.gallery);
  }

  static Future<String?> pickImageFromCamera() async {
    return pickImagePath(ImageSource.camera);
  }
}
