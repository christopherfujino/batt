import 'package:file/file.dart';

class Context {
  final Directory root;
  final FileSystem fs;

  Context({required this.fs, required this.root});
}
