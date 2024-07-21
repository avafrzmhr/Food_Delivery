import 'package:food_delivery/data/model/neshan/neshan_response.dart';
import 'package:food_delivery/data/model/neshan/neshan_search_address_request.dart';
import 'package:food_delivery/data/model/neshan/neshan_search_response/item.dart';
import 'package:food_delivery/data/source/location_source.dart';
import 'package:location/location.dart';

abstract class ILocationRepository {
  Future<LocationData?> getLocation();
  Future<NeshanResponse?> getNeshanLocation(double lat, double lang);
  Future<NeshanResponse?> setLocation(double lat, double lang);
  Future<List<Item>> searchLocation(NeshanSearchAddressRequest request);
}

class LocationRepository implements ILocationRepository {
  final LocationDataSource locationDataSource;
  LocationRepository(this.locationDataSource);
  @override
  Future<LocationData?> getLocation() async =>
      await locationDataSource.getLocation();

  @override
  Future<NeshanResponse?> getNeshanLocation(double lat, double lang) async =>
      await locationDataSource.getNeshanLocation(lat, lang);

  @override
  Future<NeshanResponse?> setLocation(double lat, double lang) async =>
      await locationDataSource.setLocation(lat, lang);

  @override
  Future<List<Item>> searchLocation(NeshanSearchAddressRequest request) async =>
      await locationDataSource.searchLocation(request);
}
