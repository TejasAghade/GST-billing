import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

 part 'auth_local_repository.g.dart';

@Riverpod(keepAlive: true)
AuthLocalRepository authLocalRepository(AuthLocalRepositoryRef ref){
  return AuthLocalRepository();
}

class AuthLocalRepository{
  late SharedPreferences localStorage;

  Future<void> init() async{
    localStorage = await SharedPreferences.getInstance();
  }
  
  Future<bool> setString({required String key, required String value}) async{
    return localStorage.setString(key, value);
  }

  Future<String?> getString({required String key,}) async{
    return localStorage.getString(key);
  }


  Future<void> setAccessAndRefreshTokens({required String accessToken, required String refreshToken}) async{
    try{
      await setString(key: "accessToken", value: accessToken);
      await setString(key: "refreshToken", value: refreshToken);
    }catch(e){
      print(e.toString());
    }
  }
  

}