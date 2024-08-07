import 'package:shop_management/common/services/local_storage.dart';

class AuthService{ 

  late LocalStorageService ls;

  AuthService(){
    ls = LocalStorageService();
  }

  Future<void> setAccessAndRefreshTokens({required String accessToken, required String refreshToken}) async{
    await ls.setString(key: "accessToken", value: accessToken);
    await ls.setString(key: "refreshToken", value: refreshToken);
  }

  Future<Map<String, String>> getAccessHeaders() async{
    String? token = await ls.getString(key: "accessToken");

    var accessHeader = {
      "Content-Type": "application/json",
      "Authorization" : "Bearer $token"
    };
    return accessHeader;
  }

  Future<Map<String, String>> getRefreshHeaders() async{
    String? token = await ls.getString(key: "refreshToken");
    var accessHeader = {
      "Content-Type": "application/json",
      "Authorization" : "Bearer $token"
    };
    return accessHeader;
  }

  bool checkSecureEndpoints({required String endpoint}){

    var endpointsCollection = {
      "/users/auth/getUser" : true,
      "/quotation/getAll" : true,
      "/entries/add" : true,
    };

    return endpointsCollection[endpoint] ?? false;

  }

}