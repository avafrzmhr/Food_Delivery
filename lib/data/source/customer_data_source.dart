import 'package:dio/dio.dart';
import 'package:food_delivery/providers.dart';

class CustomerDataSource {
  Dio dio = Dio();

  Future<Response> customerAddress(
      String addressName, double lat, double long) async {
    Response response1 = await dio.get(
      'http://127.0.0.1:8000/account/customer_address',
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${Providers.prefs.getString('access')}',
        },
      ),
    );
    int id = response1.data['id'];
    Response response = await dio.put(
      "http://127.0.0.1:8000/account/customer_address/$id",
      data: {
        "address_name": addressName,
        "latitude": lat,
        "longitude": long,
      },
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${Providers.prefs.getString('access')}',
        },
      ),
    );
    return response;
  }
}
