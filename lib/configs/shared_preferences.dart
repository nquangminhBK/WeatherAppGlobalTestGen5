import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

const SECURE_STORAGE_KEY = "vess";
class SharedPreference {
  static final shared = SharedPreference();
  Box? _hiveBox;

  Future<void> openHiveBox() async {
    const FlutterSecureStorage secureStorage= FlutterSecureStorage();
    var containsEncryptionKey =
    await secureStorage.containsKey(key: SECURE_STORAGE_KEY);
    if (!containsEncryptionKey) {
      var key = Hive.generateSecureKey();
      await secureStorage.write(
          key: SECURE_STORAGE_KEY, value: base64UrlEncode(key));
    }

    final _decode = await secureStorage.read(key: SECURE_STORAGE_KEY);
    var encryptionKey = base64Url.decode(_decode!);

    var dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    _hiveBox = await Hive.openBox("Box",
        encryptionCipher: HiveAesCipher(encryptionKey));
  }

  read(String key) {
    final data = _hiveBox?.get(key);
    return data;
  }

  Future<void> save(String key, value) async {
    await _hiveBox?.put(key, value);
  }

  Future<void> remove(String key) async {
    await _hiveBox?.delete(key);
  }

  // Future<void> saveUser(Login? user) async {
  //   final data = user?.toJson();
  //   await save(KeyPreference.loginUser, data);
  // }
  //
  // User? getUser() {
  //   final data = _hiveBox?.get(KeyPreference.loginUser);
  //   if (data != null) {
  //     final map = Map<String, dynamic>.from(data);
  //     final user = User.fromJson(map);
  //     return user;
  //   }
  //   return null;
  // }


}
