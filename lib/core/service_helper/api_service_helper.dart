import "dart:convert";

import "package:http/http.dart" as http;
import "package:shop_management/core/service_helper/auth_service_helper.dart";


class ApiService{

  AuthService authService = AuthService();

  final String _baseUrl = "http://127.0.0.1:8000/api/v1";

  Future<http.Response> post({required String endpoint, required dynamic body}) async{
    var accessHeader = await authService.getAccessHeaders();
    var res = await http.post(
      Uri.parse(_baseUrl+endpoint), 
      headers: authService.checkSecureEndpoints(endpoint: endpoint)? accessHeader : {},
      body: authService.checkSecureEndpoints(endpoint: endpoint)? jsonEncode(body) : body
    );
    return res;
  }

  Future<http.Response> get({required String endpoint}) async{
    var accessHeader = await authService.getAccessHeaders();
    var res = await http.get(
      Uri.parse(_baseUrl+endpoint), 
      headers: authService.checkSecureEndpoints(endpoint: endpoint)? accessHeader : {}
    );
    
    return res;

  }


}