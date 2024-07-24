import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService{
  Future<SharedPreferences> sharedPref = SharedPreferences.getInstance();
  late SharedPreferences localStorage;

  Future<bool> setString({required String key, required String value}) async{
    localStorage = await sharedPref;
    return localStorage.setString(key, value);
  }

  Future<String?> getString({required String key,}) async{
    localStorage = await sharedPref;
    return localStorage.getString(key);
  }
  

}