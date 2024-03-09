import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class IEnvManager {
  Future<void> init();
  String? get(String key);
}

class EnvManager implements IEnvManager {
  static final EnvManager _instance = EnvManager._internal();

  static EnvManager get instance {
    return _instance;
  }

  EnvManager._internal();

  @override
  Future<void> init() async {
    await dotenv.load(fileName: ".env");
  }

  @override
  String? get(String key) {
    return dotenv.env[key];
  }
}
