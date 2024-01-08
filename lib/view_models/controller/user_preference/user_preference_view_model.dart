import 'package:getx_mvvm/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreference {
  Future<bool> saveUser(LoginResponseModel responseModel) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('token', responseModel.token.toString());
    sp.setBool('isLogin', responseModel.isLogin!);
    return true;
  }

  Future<LoginResponseModel> getUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? token = sp.getString(
      'token',
    );

    bool? isLogin = sp.getBool(
      'isLogin',
    );
    return LoginResponseModel(
      token: token,
      isLogin: isLogin,
    );
  }

  Future<bool> removeUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.clear();
    return true;
  }
}
