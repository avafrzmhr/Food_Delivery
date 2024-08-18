import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/main.dart';
import 'package:food_delivery/views/customers/home/bloc/customer_address_bloc.dart';
import 'package:food_delivery/views/location/bloc/location_bloc.dart';
import 'package:food_delivery/views/location/location_screen.dart';
import 'package:food_delivery/views/customers/shopping_cart/shopping_cart_screen.dart';
import 'package:location/location.dart';

class TopBarWidget extends StatefulWidget {
  final BoxConstraints? constraints;
  final bool isOnline;
  final bool isLocationChaned;
  double? lat;
  double? lang;

  TopBarWidget({
    this.constraints,
    required this.isOnline,
    this.isLocationChaned = false,
    this.lat,
    this.lang,
  });

  @override
  _TopBarWidgetState createState() => _TopBarWidgetState();
}

class _TopBarWidgetState extends State<TopBarWidget> {
  double defaultLat = 35.6997;
  double defaultLong = 51.3380;
  LocationData? location;
  String? city;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final bloc = BlocProvider.of<LocationBloc>(context);

      if (!widget.isOnline) {
        // Check if location is already set or cached
        if (!widget.isLocationChaned &&
            (widget.lat == null || widget.lang == null)) {
          // Fetch the cached location
          widget.lat = MyApp.sharedPreferences.getDouble('Lat');
          widget.lang = MyApp.sharedPreferences.getDouble('Long');

          // If no cached location, start the location fetching process
          if (widget.lat == null || widget.lang == null) {
            bloc.add(LocationStarted());
          } else {
            bloc.add(LocationChanged(
              lat: widget.lat!,
              lang: widget.lang!,
            ));
          }
        } else if (widget.isLocationChaned) {
          bloc.add(LocationChanged(
            lat: widget.lat ?? defaultLat,
            lang: widget.lang ?? defaultLong,
          ));
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CustomerAddressBloc(),
        ),
      ],
      child: BlocConsumer<LocationBloc, LocationState>(
        listenWhen: (previous, current) => current != previous,
        listener: (context, state) {
          if (state is LocationLoading || state is LocationInitial) {
            print('state is Loading****');
          } else if (state is LocationSuccess) {
            city = MyApp.sharedPreferences.getString('City') ??
                state.location.city ??
                state.location.county ??
                '';

            if (state.locationData != null) {
              widget.lat = state.locationData?.latitude;
              widget.lang = state.locationData?.longitude;
            } else {
              widget.lat =
                  MyApp.sharedPreferences.getDouble('Lat') ?? defaultLat;
              widget.lang =
                  MyApp.sharedPreferences.getDouble('Long') ?? defaultLong;
            }
            BlocProvider.of<CustomerAddressBloc>(context)
                .add(CustomerAddressRequestEvent(
              MyApp.sharedPreferences.getString('Address') ?? '',
              widget.lat!,
              widget.lang!,
            ));
            print(MyApp.sharedPreferences.getString('Address'));
            print(widget.lang);
            print(widget.lat);
          } else if (state is LocationError) {
            print('state is error *** //${state.message}');
          }
        },
        buildWhen: (previous, current) {
          return (current != previous && widget.isOnline) ||
              (current != previous &&
                  !widget.isOnline &&
                  widget.lat != null &&
                  widget.lang != null);
        },
        builder: (context, state) {
          return Column(
            children: [
              const SizedBox(
                height: 26,
              ),
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                      left: 20,
                    ),
                    // height: 40,
                    // width: 40,
                    child: IconButton(
                      iconSize: 27,
                      icon: const Icon(Icons
                          .shopping_cart), // Update this icon as per your assets
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const ShoppingCartScreen();
                        }));
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text(
                            'مقصد',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          (state is LocationInitial)
                              ? const CupertinoActivityIndicator()
                              : state is LocationSuccess
                                  ? GestureDetector(
                                      onTap: () {
                                        if (widget.isLocationChaned) {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    LocationScreen(
                                                  lat: MyApp.sharedPreferences
                                                          .getDouble('Lat') ??
                                                      widget.lat ??
                                                      defaultLat,
                                                  lang: MyApp.sharedPreferences
                                                          .getDouble('Long') ??
                                                      widget.lang ??
                                                      defaultLong,
                                                  cityName: state
                                                          .location.city ??
                                                      state.location.county ??
                                                      '',
                                                ),
                                              ));
                                        } else {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    LocationScreen(
                                                  lat: MyApp.sharedPreferences
                                                          .getDouble('Lat') ??
                                                      state.locationData!
                                                          .latitude!,
                                                  lang: MyApp.sharedPreferences
                                                          .getDouble('Long') ??
                                                      state.locationData!
                                                          .longitude!,
                                                  cityName: state
                                                          .location.city ??
                                                      state.location.county ??
                                                      '',
                                                ),
                                              ));
                                        }
                                      },
                                      child: Container(
                                          margin: const EdgeInsets.only(
                                            left: 25,
                                          ),
                                          child: const Icon(
                                            size: 27,
                                            Icons.location_on_sharp,
                                            color:
                                                Color.fromRGBO(48, 24, 172, 1),
                                          )),
                                    )
                                  : state is LocationError
                                      ? Text(state.message)
                                      : const Text(''),
                        ],
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      MyApp.sharedPreferences.getString('Address') != null
                          ? Row(
                              children: [
                                Text(
                                  MyApp.sharedPreferences
                                          .getString('Address') ??
                                      '',
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            )
                          : Container(),
                    ],
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
