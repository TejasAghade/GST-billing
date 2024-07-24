import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shop_management/fetures/auth/model/user_model.dart';
import 'package:shop_management/fetures/auth/repositories/auth_local_repository.dart';
import 'package:shop_management/fetures/auth/repositories/auth_remote_repository.dart';

part 'auth_viewmodel.g.dart';

@riverpod
class AuthViewModel extends _$AuthViewModel{

  late AuthRemoteRepository _authRemoteRepository;
  late AuthLocalRepository _authLocalRepository;
  
  @override
  AsyncValue<UserModel>? build(){
    _authRemoteRepository = ref.watch(authRemoteRepositoryProvider);
    _authLocalRepository = ref.watch(authLocalRepositoryProvider);
    return null;
  }

  Future<void> initSharedPrefrences() async{
    await _authLocalRepository.init();
  }

  Future<void> signUpUser({
    required String phoneNumber,
    required String password,
    required String fullName
  }) async{
    state = const AsyncValue.loading();
    var res = await _authRemoteRepository.signup(
      phoneNo: phoneNumber, 
      password: password,
      fullName: fullName
    );
    
    var val = switch(res){
      Left(value : final l)=> state = AsyncValue.error(
        l.message, StackTrace.current
      ),
      Right(value : final r)=> state = AsyncValue.data(r)
    };
  }

  

  Future<void> signInUser({
    required String phoneNumber,
    required String password,
  }) async{
    state = const AsyncValue.loading();
    var res = await _authRemoteRepository.login(
      phoneNo: phoneNumber, 
      password: password 
    );

    var val = switch(res){
      Left(value : final l)=> state = AsyncValue.error(
        l.message, StackTrace.current
      ),
      Right(value : final r)=> _loginSuccess(r)
    };
  }

  AsyncValue<UserModel>? _loginSuccess(UserModel userData){
    _authLocalRepository.setAccessAndRefreshTokens(accessToken: userData.data!.accessToken!, refreshToken: userData.data!.refreshToken!);
    return state = AsyncValue.data(userData);
  }


}