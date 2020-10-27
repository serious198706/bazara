import 'package:shared_preferences/shared_preferences.dart';

Future<T> readPreference<T>(String key) async {
  SharedPreferences sp = await SharedPreferences.getInstance();

  if (T == String)
    return sp.getString(key) as T;
  else if (T == int)
    return sp.getInt(key) as T;
  else if (T == bool)
    return sp.getBool(key) as T;
  else
    return sp.get(key) as T;
}

Future<void> writePreference<T>(String key, T value) async {
  SharedPreferences sp = await SharedPreferences.getInstance();

  if (T == String)
    sp.setString(key, value as String);
  else if (T == int)
    sp.setInt(key, value as int);
  else if (T == bool)
    sp.setBool(key, value as bool);
  else
    throw Exception('Not supported type');
}

Future<void> deletePreference(String key) async {
  await SharedPreferences.getInstance()..remove(key);
}