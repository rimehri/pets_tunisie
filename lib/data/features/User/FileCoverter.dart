import 'dart:convert';
import 'dart:io';

class FileConverter {
  static String getBase64FormateFile(String path) {
    print('**********************************');
    print(path);
    File file = File(path);
    print('File is = ' + file.toString());
    List<int> fileInByte = file.readAsBytesSync();
    String fileInBase64 = base64Encode(fileInByte);
    return fileInBase64;
  }
}
