import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shop_management/fetures/auth/model/user_model.dart';

part 'current_user_notifier.g.dart';

@Riverpod(keepAlive : true)
class CurrentUserNotifier extends _$CurrentUserNotifier{

  @override
  UserModel? build(){
    return null;
  }

  void addUser(UserModel? user){
    state = user;
  }

  void printUser(){
    print(state.toString());
  }

}