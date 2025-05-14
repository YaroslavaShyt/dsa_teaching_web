import 'dart:io';

import 'package:file_picker/file_picker.dart';

class FileHandler {
  final FilePicker _filePicker = FilePicker.platform;

  final String _documentsPath = '/storage/emulated/0/Documents';

  Future<File?> pickFile({List<String>? allowedExtensions}) async {
    final FilePickerResult? result = await _filePicker.pickFiles(
      initialDirectory: _documentsPath,
      type: FileType.custom,
      allowedExtensions: allowedExtensions,
    );
    if (result == null) {
      return null;
    }

    return File(result.xFiles.first.path);
  }
}
