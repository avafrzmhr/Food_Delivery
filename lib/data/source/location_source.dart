import 'package:dio/dio.dart';
import 'package:food_delivery/data/model/neshan/neshan_response.dart';
import 'package:food_delivery/data/model/neshan/neshan_search_address_request.dart';
import 'package:food_delivery/data/model/neshan/neshan_search_response/item.dart';

import 'package:location/location.dart';

class LocationDataSource {
  Location location = Location();
  Dio dio = Dio();
  late PermissionStatus _permissionGranted;
  late LocationData _locationData;

  Future<LocationData?> getLocation() async {
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.granted) {
      _locationData = await location.getLocation();
      return _locationData;
    }
    if (_permissionGranted == PermissionStatus.denied ||
        _permissionGranted == PermissionStatus.deniedForever) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted == PermissionStatus.granted) {
        return await getLocation();
      }
    }

    return null;
  }

  Future<NeshanResponse?> getNeshanLocation(double lat, double lang) async {
    var res = await dio.get(
      'https://api.neshan.org/v5/reverse?lat=$lat&lng=$lang',
      options: Options(
        headers: {
          'Api-Key': 'service.501d0bdc5e714305bc7d20bbb49e0610',
        },
      ),
    );

    if (res.data['status'] == 'OK') {
      return NeshanResponse.fromJson(res.data);
    } else {
      return null;
    }
  }

  Future<NeshanResponse?> setLocation(double lat, double lang) async {
    var response = await getNeshanLocation(lat, lang);
    if (response != null) {
      return response;
    } else {
      return null;
    }
  }

  Future<List<Item>> searchLocation(NeshanSearchAddressRequest request) async {
    // final Dio neshanSearchHttpClient = createApiClient(neshanSearchUrl)
    //   ..options.headers['Api-Key'] = neshanApiKey;
    var res = await dio.get(
      'https://api.neshan.org/v1/search?term=${request.address}&lat=${request.lat}&lng=${request.lang}',
      options: Options(
        headers: {
          'Api-Key': 'service.501d0bdc5e714305bc7d20bbb49e0610',
        },
      ),
    );

    if (res.statusCode == 200) {
      List<Item> itemList = [];
      for (var element in (res.data['items'] as List)) {
        itemList.add(Item.fromJson(element));
      }
      return itemList;
    } else {
      return [];
    }
  }
}
