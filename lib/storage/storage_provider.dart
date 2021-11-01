import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageProvider {
  StorageProvider({required this.flutterSecureStorage})
      : assert(flutterSecureStorage != null);

  final FlutterSecureStorage flutterSecureStorage;

  static const String storageappBaseKeyKey = 'appBaseKey';

  // appBaseKey
  Future<void> setAppBaseKey(String key) async {
    await flutterSecureStorage.write(key: storageappBaseKeyKey, value: key);
  }

  Future<void> clearAppBaseKey() async {
    await flutterSecureStorage.delete(key: storageappBaseKeyKey);
  }

  Future<String?> getAppBaseKey() async {
    return await flutterSecureStorage.read(key: storageappBaseKeyKey);
  }
}
