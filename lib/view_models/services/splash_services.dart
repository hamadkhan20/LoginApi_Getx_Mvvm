import 'dart:async';

import 'package:flutter/material.dart';

import 'package:getx_mvvm/res/routes/routes_name.dart';
import 'package:getx_mvvm/view_models/controller/user_preference/user_preference_view_model.dart';

class SplashServices {
  UserPreference userPreference = UserPreference();

  void isLogin(BuildContext context) {
    userPreference.getUser().then(
      (value) {
        print(value.token);
        print(value.isLogin);
        if (value.isLogin == false || value.isLogin.toString() == 'null') {
          Timer(const Duration(seconds: 6),
              () => Navigator.pushNamed(context, RouteName.loginView));
        } else {
          Timer(const Duration(seconds: 6),
              () => Navigator.pushNamed(context, RouteName.homeScreen));
        }
      },
    );
  }
}
