import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shop_management/core/failure/failure.dart';
import 'package:shop_management/core/service_helper/api_service_helper.dart';
import 'package:shop_management/fetures/auth/model/user_model.dart';

part 'auth_remote_repository.g.dart';

@riverpod
AuthRemoteRepository authRemoteRepository(AuthRemoteRepositoryRef ref){
  return AuthRemoteRepository();
}

class AuthRemoteRepository{

  Future<Either<AppFailure, UserModel>> signup(
    {
      required String phoneNo,
      required String fullName,
      required String password,
    }
  ) async{
    try{
      var response = await ApiService().post(
        endpoint: "/auth/register", 
        body: {
          "mobileNumber":phoneNo,
          "fullName":fullName,
          "password":password
        }
      );

      if(response.statusCode > 201){
        return left(AppFailure(
          statusCode: response.statusCode, 
          success: false, 
          message: userModelFromJson(response.body).message!.toString()
        ));
      }
      return right(userModelFromJson(response.body));

    }catch(e){
      return left(
        AppFailure(
          statusCode: 500, 
          success: false,
          message: e.toString()
        )
      );
    }

  }

  Future<Either<AppFailure, UserModel>> login(
    {
      required String phoneNo,
      required String password,
    }
  ) async{
    try{
      var response = await ApiService().post(
        endpoint: "/auth/login", 
        body: {
          "mobileNumber":phoneNo,
          "password":password
        }
      );

      if(response.statusCode != 200){
        return left(AppFailure(
          statusCode: response.statusCode, 
          success: false, 
          message: userModelFromJson(response.body).message!.toString()
        ));
      }
      return right(userModelFromJson(response.body));

    }catch(e){
      return left(
        AppFailure(
          statusCode: 500, 
          success: false,
        )
      );
    }

  }

}