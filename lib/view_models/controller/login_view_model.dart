import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/models/user_model.dart';

import 'package:getx_mvvm/repository/login_repository/login_repository.dart';
import 'package:getx_mvvm/res/routes/routes_name.dart';
import 'package:getx_mvvm/utils/utils.dart';
import 'package:getx_mvvm/view_models/controller/user_preference/user_preference_view_model.dart';

class LoginViewModel extends GetxController {
  final _api = LoginRepoditory();

  UserPreference userPreference = UserPreference();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final emailFocusNode = FocusNode().obs;
  final PasswordFocusNode = FocusNode().obs;

  RxBool loading = false.obs;
  void loginApi(context) {
    loading.value = true;
    Map data = {
      'email': emailController.text,
      'password': passwordController.text,
    };
    _api
        .loginApi(
      data,
    )
        .then((value) {
      loading.value = false;
      if (value['erroe'] == 'user not  found') {
        Utils.SnackBar('login', value['erroe']);
      } else {
        LoginResponseModel loginResponseModel = LoginResponseModel(
          token: value['token'],
          isLogin: true,
        );

        userPreference.saveUser(loginResponseModel).then((value) {
          Navigator.pushNamed(context, RouteName.homeScreen);
        }).onError((error, stackTrace) {});
        Utils.SnackBar('login', 'login Successfully');
      }
    }).onError((error, stackTrace) {
      print(error.toString());
      loading.value = false;
      Utils.SnackBar('Error', error.toString());
    });
  }
}
