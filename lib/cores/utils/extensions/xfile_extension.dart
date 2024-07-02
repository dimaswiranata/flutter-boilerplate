import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

extension XFileExtension on XFile {
  /// Converts [XFile] to [PlatformFile] to unify between gallery and file picker
  Future<PlatformFile> toPlatformFile() async {
    final int size = await length();
    final Uint8List bytes = await readAsBytes();

    return PlatformFile(
      path: path,
      name: name,
      readStream: openRead(),
      size: size,
      bytes: bytes,
    );
  }
}
