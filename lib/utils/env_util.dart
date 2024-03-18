// ignore: depend_on_referenced_packages
import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvUtil {
  static Future<String> getEnvParam(String param) async {
    await dotenv.load(fileName: "../.env");
    final String result = dotenv.env[param]!;
    return result;
  }
}