import 'package:getx_mvvm/data/network/network_api_services.dart';
import 'package:getx_mvvm/models/home/user_list_model.dart';
import 'package:getx_mvvm/res/app_url/app_url.dart';

class HomeRepoditory {
  final _apiServices = NetworkApiServices();

  Future<UserListModel> UserListApi() async {
    dynamic response = await _apiServices.getApi(AppUrl.UserListApi);
    return UserListModel.fromJson(response);
  }
}
