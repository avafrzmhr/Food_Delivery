import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';

class LocationScreen extends StatefulWidget {
  // final double lat;
  // final double lang;
  // final String cityName;
  // const LocationScreen({
  //   super.key,
  //   required this.lat,
  //   required this.lang,
  //   required this.cityName,
  // });

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  MapController mapController = MapController();
  double? newLat;
  double? newLang;

  @override
  void dispose() {
    mapController.dispose();
    super.dispose();
  }

  // void _gotToCurrentLocation() async {
  //   var locationData = await getIt<IMyLocationRepository>().getLocation();
  //   mapController.move(
  //       LatLng(locationData!.latitude!, locationData.longitude!), 16);
  // }

  void _positionChanged(double lat, double lang) {
    setState(() {
      newLat = lat;
      newLang = lang;

      // UserInfos.setLat(newLat!);
      // UserInfos.setLong(newLang!);
    });
  }

  @override
  Widget build(BuildContext context) {
    // var request = NeshanSearchAddressRequest(
    //   address: widget.cityName,
    //   lat: widget.lat,
    //   lang: widget.lang,
    // );

    return Scaffold(
      body: SafeArea(
        child: MultiBlocProvider(
          providers: [
            // BlocProvider(
            //   create: (context) => LocationBloc(),
            // ),
            // BlocProvider(
            //   create: (context) => LocationSearchFieldBloc(),
            // ),
          ],
          child: Stack(
            children: [
              FlutterMap(
                mapController: mapController,
                // options: MapOptions(
                //     interactiveFlags:
                //         InteractiveFlag.pinchZoom | InteractiveFlag.drag,
                //     onPositionChanged: (position, hasGesture) {
                //       _positionChanged(position.center!.latitude,
                //           position.center!.longitude);
                //     },
                //     center: LatLng(widget.lat, widget.lang),
                //     zoom: 16,
                //     minZoom: 10,
                //     maxZoom: 18),
                children: [
                  TileLayer(
                    urlTemplate:
                        'https://map.ir/shiveh/xyz/1.0.0/Shiveh:Shiveh@EPSG:3857@png/{z}/{x}/{y}.png?x-api-key=eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6ImU3ZDU1YmE3OGJhYjIxOWI5ZTlkOTQ3NWMyZmFhNzlmNzQ5ZGEwNWNjNzU2YTgxOGI1YTZiM2QzYTE4YmM1OTlmZWFkZWVmMDBkMTEwYWIxIn0.eyJhdWQiOiIyODEwOCIsImp0aSI6ImU3ZDU1YmE3OGJhYjIxOWI5ZTlkOTQ3NWMyZmFhNzlmNzQ5ZGEwNWNjNzU2YTgxOGI1YTZiM2QzYTE4YmM1OTlmZWFkZWVmMDBkMTEwYWIxIiwiaWF0IjoxNzIxMTU2NzA1LCJuYmYiOjE3MjExNTY3MDUsImV4cCI6MTcyMzc0ODcwNSwic3ViIjoiIiwic2NvcGVzIjpbImJhc2ljIl19.pP1dXqgBbGiXUVUV96hG-WgYPKPnX1g55H688oYyKnmtuEEcjb9_B8PDgnQHyvfr1TQSJqtrkPyN02ALrsa2-VUOye4MDgGn4HUvVWCharRogsmJbinJwZKHofc9H9QssniVCKeOsGN_FDa4xhKbhVMZ8B01idaj-Cm2a-BuSAamryp4qXffL5bveNo-xlCu8zEwNwSeuGubsVH7h1O_GXR_lD5NcOXT3sFqUaV7Riko4hUMAfAg2VroG_59wzGUFs1XKSiamMi4LtMCSEjRAJDWiXbrYtnmYKwyohpynxezKBXlPAQBl94tlhsoN7ALsc6fTg5EB03s394EYG2LIA',
                    userAgentPackageName:
                        const String.fromEnvironment('APP_ID'),
                  ),
                ],
              ),
              const Positioned(
                bottom: 50,
                top: 50,
                left: 50,
                right: 50,
                child: Icon(
                  Icons.location_on,
                  color: Colors.red,
                  size: 48,
                ),
              ),
              Positioned(
                bottom: 85,
                right: 16,
                child: IconButton(
                  onPressed: () {
                    // _gotToCurrentLocation();
                  },
                  icon: const Icon(Icons.my_location),
                  color: Colors.blueAccent,
                  iconSize: 32,
                ),
              ),
              // Positioned(
              //   top: 16,
              //   left: 16,
              //   right: 16,
              //   child: Container(
              //     color: Colors.white70,
              //     child: LocationSearchField(
              //       request: request,
              //       onSuggestionSelected: (selectedGuild) {
              //         mapController.move(
              //             LatLng(selectedGuild.location!.y!,
              //                 selectedGuild.location!.x!),
              //             12);
              //       },
              //       onClearSearch: () {},
              //     ),
              //   ),
              // ),
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
                            .copyWith(color: Colors.white),
                      ),
                      onPressed: () {
                        // Future.delayed(const Duration(microseconds: 300))
                        //     .then((value) {
                        //   context.read<LocationBloc>().add(LocationChanged(
                        //         lat: newLat ?? widget.lat,
                        //         lang: newLang ?? widget.lang,
                        //       ));
                        //   MyNavigator.pushReplacement(
                        //     context,
                        //     MerchantListScreen(
                        //       isOnline: false,
                        //       isLocationChaned: true,
                        //       lat: newLat ?? widget.lat,
                        //       lang: newLang ?? widget.lang,
                        //     ),
                        //   );
                        //   Navigator.pop(context);
                        // });
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
