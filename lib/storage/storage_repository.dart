import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'storage_provider.dart';

mixin StorageRepository {
  final _store = StorageProvider(flutterSecureStorage: FlutterSecureStorage());

  Future<void> setAppBaseKey(String appBaseKey) =>
      _store.setAppBaseKey(appBaseKey);

  Future<void> clearAppBaseKey() => _store.clearAppBaseKey();

  Future<String?> getAppBaseKey() => _store.getAppBaseKey();
}
