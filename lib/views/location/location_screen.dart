import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:food_delivery/data/model/neshan/neshan_search_address_request.dart';
import 'package:food_delivery/data/repository/location_repository.dart';
import 'package:food_delivery/data/source/location_source.dart';
import 'package:food_delivery/providers.dart';
import 'package:food_delivery/views/location/bloc/location_bloc.dart';
import 'package:food_delivery/views/location/location_provider.dart';
import 'package:food_delivery/views/location/location_serchfield/bloc/location_search_field_bloc.dart';
import 'package:food_delivery/views/location/location_serchfield/location_search_field.dart';
import 'package:food_delivery/views/tabs_screen.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';

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

  void _positionChanged(BuildContext context, double lat, double lang) {
    setState(() {
      newLat = lat;
      newLang = lang;

      Providers.prefs.setDouble('Lat', newLat!);
      Providers.prefs.setDouble('Long', newLang!);
    });
  }

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
                LocationRepository(
                  LocationDataSource(),
                ),
              ),
            ),
            BlocProvider(
              create: (context) =>
                  LocationBloc(locationRepository)..add(LocationStarted()),
            ),
          ],
          child: BlocBuilder<LocationBloc, LocationState>(
            builder: (context, state) {
              return Stack(
                children: [
                  FlutterMap(
                    mapController: mapController,
                    options: MapOptions(
                      // onPositionChanged: (position, hasGesture) {
                      //   hasGesture = true;
                      //   if (hasGesture) {
                      //     _positionChanged(
                      //         position.center.latitude, position.center.longitude);
                      //         _setMarker(LatLng(position.center.latitude, position.center.longitude));
                      //   }
                      // },
                      minZoom: 2,
                      initialCenter: const LatLng(35.592781, 51.351981),
                      initialZoom: 10,
                      onTap: (TapPosition tapPosition, LatLng latlng) {
                        _setMarker(latlng);
                        _positionChanged(
                            context, latlng.latitude, latlng.longitude);
                        BlocProvider.of<LocationBloc>(context).add(
                            LocationChanged(
                                lat: latlng.latitude, lang: latlng.longitude));
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
                          if (_marker != null) _marker!,
                        ],
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 85,
                    right: 16,
                    child: IconButton(
                      onPressed: () {
                        _gotToCurrentLocation();
                      },
                      icon: const Icon(Icons.my_location),
                      color: Colors.blueAccent,
                      iconSize: 32,
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
                                .copyWith(
                                    color:
                                        const Color.fromRGBO(48, 24, 172, 1)),
                          ),
                          onPressed: () {
                            Future.delayed(const Duration(microseconds: 300))
                                .then((value) {
                              // context.read<LocationBloc>().add(LocationChanged(
                              //       lat: newLat ?? widget.lat,
                              //       lang: newLang ?? widget.lang,
                              //     ));
                              Provider.of<LocationProvider>(context,
                                      listen: false)
                                  .updateLocation(
                                newLat ?? widget.lat,
                                newLang ?? widget.lang,
                              );

                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return const TabsScreen();
                              }));
                            });
                          }),
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
