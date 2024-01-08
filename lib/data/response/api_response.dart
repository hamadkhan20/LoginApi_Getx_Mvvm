import 'package:getx_mvvm/data/response/status.dart';

class ApiResponse<T> {
  Status? status;
  T? data;
  String? messege;

  ApiResponse(this.status, this.data, this.messege);

  ApiResponse.loading() : status = Status.LOADING;
  ApiResponse.completed(this.data) : status = Status.COMPLETED;
  ApiResponse.error(this.messege) : status = Status.ERROR;

  @override
  String toString() {
    return "Status: $status \n Messege: $messege \n Data: $data";
  }
}
