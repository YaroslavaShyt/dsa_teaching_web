import 'dart:html' as html;
import 'dart:typed_data';

class WebFile {
  final html.File file;
  final Uint8List bytes;

  WebFile(this.file, this.bytes);
}
