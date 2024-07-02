import 'dart:io';
import 'dart:typed_data';

import 'package:flutterboilerplate/cores/index.dart';
import 'package:path_provider/path_provider.dart';

extension Uint8ListX on Uint8List {
  Future<File> toSignatureFile() async {
    final tempDir = await getTemporaryDirectory();
    String fileName = 'signature_${StringHelper.generateRandomString(10)}';
    File file = await File('${tempDir.path}/$fileName.png').create();
    file.writeAsBytesSync(this);

    return file;
  }
}
