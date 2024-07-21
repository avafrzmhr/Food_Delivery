import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:food_delivery/data/model/neshan/neshan_search_address_request.dart';
import 'package:food_delivery/data/repository/location_repository.dart';
import 'package:food_delivery/data/source/location_source.dart';
import 'package:food_delivery/providers.dart';
import 'package:food_delivery/views/location/bloc/location_bloc.dart';
import 'package:food_delivery/views/location/location_serchfield/bloc/location_search_field_bloc.dart';
import 'package:food_delivery/views/location/location_serchfield/location_search_field.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';

class LocationScreen extends StatefulWidget {
  final double lat;
  final double lang;
  final String cityName;
  const LocationScreen({
    super.key,
    required this.lat,
    required this.lang,
    required this.cityName,
  });

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  final MapController mapController = MapController();
  LocationData? _locationData;
  Marker? _marker;
  double? newLat;
  double? newLang;
  LocationRepository locationRepository =
      LocationRepository(LocationDataSource());

  @override
  void dispose() {
    mapController.dispose();
    super.dispose();
  }

  void _gotToCurrentLocation() async {
    var locationData = await locationRepository.getLocation();
    mapController.move(
        LatLng(locationData!.latitude!, locationData.longitude!), 16);
  }

  void _positionChanged(double lat, double lang) {
    setState(() {
      newLat = lat;
      newLang = lang;

      Providers.prefs.setDouble('Lat', newLat!);
      Providers.prefs.setDouble('Long', newLang!);
    });
  }

  // void getUserLocation() async {
  //   Location location = Location();
  //   bool _serviceEnabled;
  //   PermissionStatus _permissionGranted;

  //   _serviceEnabled = await location.serviceEnabled();
  //   if (!_serviceEnabled) {
  //     _serviceEnabled = await location.requestService();
  //     if (!_serviceEnabled) {
  //       return;
  //     }
  //   }

  //   _permissionGranted = await location.hasPermission();
  //   if (_permissionGranted == PermissionStatus.denied) {
  //     _permissionGranted = await location.requestPermission();
  //     if (_permissionGranted != PermissionStatus.granted) {
  //       return;
  //     }
  //   }

  //   _locationData = await location.getLocation();

  //   location.changeSettings(accuracy: LocationAccuracy.high);
  //   location.enableBackgroundMode(enable: true);
  //   location.onLocationChanged.listen((LocationData event) {
  //     setState(() {
  //       _locationData = event;
  //     });
  //   });

  //   setState(() {});
  //   print("User Location");
  //   print(_locationData?.latitude ?? 0);
  //   print(_locationData?.longitude ?? 0);
  // }

  @override
  void initState() {
    // getUserLocation();
    super.initState();
  }

  void _setMarker(LatLng latlng) {
    setState(() {
      _marker = Marker(
        point: latlng,
        child: const Icon(Icons.location_pin,
            color: Color.fromRGBO(48, 24, 172, 1), size: 40),
      );
      mapController.move(latlng, mapController.camera.zoom);
    });
  }

  @override
  Widget build(BuildContext context) {
    context.read<Providers>().init(context);
    var request = NeshanSearchAddressRequest(
      address: widget.cityName,
      lat: widget.lat,
      lang: widget.lang,
    );
    return Scaffold(
      body: SafeArea(
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => LocationSearchFieldBloc(
                  LocationRepository(LocationDataSource())),
            ),
            BlocProvider(
              create: (context) => LocationBloc(locationRepository),
            ),
          ],
          child: Stack(
            children: [
              FlutterMap(
                mapController: mapController,
                options: MapOptions(
                  minZoom: 2,
                  initialCenter: const LatLng(35.592781, 51.351981),
                  initialZoom: 10,
                  onTap: (TapPosition tapPosition, LatLng latlng) {
                    _setMarker(latlng);
                    print(latlng);
                  },
                ),
                children: [
                  TileLayer(
                    urlTemplate:
                        'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    userAgentPackageName: 'com.example.app',
                  ),
                  MarkerLayer(
                    markers: [
                      Marker(
                        point: const LatLng(35, 55),
                        child: IconButton(
                          icon: const Icon(Icons.ac_unit),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return const AlertDialog(
                                  title: Text("Sample Location"),
                                );
                              },
                            );
                          },
                        ),
                      ),
                      if (_locationData != null)
                        Marker(
                          point: LatLng(_locationData!.latitude ?? 0,
                              _locationData!.longitude ?? 0),
                          child: const Icon(Icons.location_on,
                              size: 40, color: Colors.blue),
                        ),
                      if (_marker != null) _marker!,
                    ],
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      FloatingActionButton(
                        heroTag: 'zoomIn', // Unique hero tag
                        child: const Icon(Icons.add),
                        onPressed: () {
                          mapController.move(
                            mapController.camera.center,
                            mapController.camera.zoom + 1,
                          );
                        },
                      ),
                      const SizedBox(height: 12),
                      FloatingActionButton(
                        heroTag: 'zoomOut', // Unique hero tag
                        child: const Icon(Icons.remove),
                        onPressed: () {
                          mapController.move(
                            mapController.camera.center,
                            mapController.camera.zoom - 1,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: FloatingActionButton(
                    heroTag: 'myLocation', // Unique hero tag
                    child: const Icon(Icons.my_location),
                    onPressed: () {
                      mapController.move(
                        LatLng(_locationData?.latitude ?? 0,
                            _locationData?.longitude ?? 0),
                        12,
                      );
                    },
                  ),
                ),
              ),
              Positioned(
                top: 16,
                left: 16,
                right: 16,
                child: Container(
                  color: Colors.white70,
                  child: LocationSearchField(
                    request: request,
                    onSuggestionSelected: (selectedGuild) {
                      mapController.move(
                          LatLng(selectedGuild.location!.y!,
                              selectedGuild.location!.x!),
                          12);
                    },
                    onClearSearch: () {},
                  ),
                ),
              ),
              Positioned(
                bottom: 16,
                right: 16,
                left: 16,
                child: SizedBox(
                  width: 90,
                  height: 64,
                  child: ElevatedButton(
                      child: Text(
                        'انتخاب',
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(color: Color.fromRGBO(48, 24, 172, 1)),
                      ),
                      onPressed: () {
                        Future.delayed(const Duration(microseconds: 300))
                            .then((value) {
                          context.read<LocationBloc>().add(LocationChanged(
                                lat: newLat ?? widget.lat,
                                lang: newLang ?? widget.lang,
                              ));
                          // Navigator.pushReplacement(
                          //   context,
                          //   MerchantListScreen(
                          //     isOnline: false,
                          //     isLocationChaned: true,
                          //     lat: newLat ?? widget.lat,
                          //     lang: newLang ?? widget.lang,
                          //   ),
                          // );
                          Navigator.pop(context);
                        });
                      }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
