import 'dart:developer';

import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutterboilerplate/cores/index.dart';

class FilePickerHelper {
  FilePickerHelper._();

  static Future<PlatformFile?> pickFile() async {
    try {
      final FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf', 'jpg', 'jpeg'],
      );

      return result?.files.single;
    } catch (e) {
      log(e.toString(), name: 'Error File Picker');
      return null;
    }
  }

  static Future<PlatformFile?> pickImageFromGallery() async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? result = await picker.pickImage(
        source: ImageSource.gallery,
        requestFullMetadata: false,
        imageQuality: 100,
      );

      return result?.toPlatformFile();
    } catch (e) {
      log(e.toString(), name: 'Error Image Picker');
      return null;
    }
  }

  static String findLastPath(String urlString) {
    Uri uri = Uri.parse(urlString);

    List<String> pathSegments = uri.pathSegments;

    String lastSegment = pathSegments.isNotEmpty ? pathSegments.last : '';

    return lastSegment;
  }
}
