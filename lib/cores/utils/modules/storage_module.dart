import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class StorageModule {
  @lazySingleton
  // ignore: invalid_annotation_target
  @preResolve
  Future<SharedPreferences> get sharedPreference async =>
      await SharedPreferences.getInstance();
}
