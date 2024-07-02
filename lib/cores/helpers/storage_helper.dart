import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageHelper<T> {
  final FlutterSecureStorage _storage = const FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
    iOptions: IOSOptions(accessibility: KeychainAccessibility.first_unlock),
  );

  /// This function will get value from secure storage
  Future<T?> read(String key) async {
    String? value = await _storage.read(
      key: key,
    );
    if (value != null) {
      if (T == String) {
        return value as T;
      } else if (T == int) {
        return int.tryParse(value) as T?;
      } else if (T == bool) {
        if (value.toLowerCase() == 'true') {
          return true as T;
        } else if (value.toLowerCase() == 'false') {
          return false as T;
        }
      } else if (T == double) {
        return double.tryParse(value) as T?;
      } else if (T == List<String>) {
        return value.split(',') as T;
      }
    }
    return null;
  }

  /// This function will set value into secure storage
  Future<void> store(String key, dynamic value) async {
    var types = T;
    switch (types) {
      case String:
        await _storage.write(
          key: key,
          value: value.toString(),
        );
        break;
      case int:
        await _storage.write(
          key: key,
          value: value.toString(),
        );
        break;
      case bool:
        await _storage.write(
          key: key,
          value: value.toString(),
        );
        break;
      case double:
        await _storage.write(
          key: key,
          value: value.toString(),
        );
        break;
      case const (List<dynamic>):
        if (value is List<String>) {
          await _storage.write(
            key: key,
            value: value.join(','),
          );
        } else {
          throw ArgumentError('Invalid value type for List');
        }
        break;
    }
  }

  /// Clear all stored data from secure storage
  Future<void> clear() async {
    await _storage.deleteAll();
  }

  /// Remove a specific key from secure storage
  Future<void> remove(String key) async {
    await _storage.delete(key: key);
  }
}
