import 'dart:async';
import 'dart:io';

class Logger {
  String tempDir = "";
  String get _localPath {
    if(tempDir.isEmpty)
      tempDir = Directory.systemTemp.path;
    return tempDir;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    print('$tempDir/log.txt');
    return File('$tempDir/log_localtime.txt');
  }

  Future<int> readLog() async {
    try {
      final file = await _localFile;

      // Read the file
      String contents = await file.readAsString();

      return int.parse(contents);
    } catch (e) {
      // If encountering an error, return 0
      return 0;
    }
  }

  Future<File> writeLog(String content) async {
    final file = await _localFile;

    // Write the file
    return file.writeAsString(content);
  }
}