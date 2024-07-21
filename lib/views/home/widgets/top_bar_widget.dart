import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/gen/assets.gen.dart';
import 'package:food_delivery/providers.dart';
import 'package:food_delivery/views/location/bloc/location_bloc.dart';
import 'package:food_delivery/views/location/location_screen.dart';
import 'package:food_delivery/views/shopping_cart/shopping_cart_screen.dart';
import 'package:location/location.dart';

class TopBarWidget extends StatefulWidget {
  final BoxConstraints constraints;
  final bool isOnline;
  final bool isLocationChaned;
  double? lat;
  double? lang;
  final LocationBloc? locationBloc;
  TopBarWidget(
      {required this.isOnline,
      super.key,
      this.isLocationChaned = false,
      this.lat,
      this.lang,
      this.locationBloc,
      required this.constraints});

  @override
  State<TopBarWidget> createState() => _TopBarWidgetState();
}

class _TopBarWidgetState extends State<TopBarWidget> {
  double defaultLat = 35.6997;
  double defaultLong = 51.3380;
  LocationData? location;
  String? city;

  @override
  void initState() {
    super.initState();
    final bloc = BlocProvider.of<LocationBloc>(context);
    if (!widget.isOnline) {
      if (!widget.isLocationChaned) {
        bloc.add(LocationStarted());
      } else {
        bloc.add(LocationChanged(
          lat: widget.lat ?? defaultLat,
          lang: widget.lang ?? defaultLong,
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    context.read<Providers>().init(context);
    return BlocConsumer<LocationBloc, LocationState>(
      listenWhen: (previous, current) => current != previous,
      listener: (context, state) {
        if (state is LocationLoading || state is LocationInitial) {
          print('state is Loading****');
        } else if (state is LocationSuccess) {
          city = Providers.prefs.getString('City') ??
              state.location.city ??
              state.location.county ??
              '';

          if (state.locationData != null) {
            widget.lat = state.locationData?.latitude;
            widget.lang = state.locationData?.longitude;
          } else {
            widget.lat = Providers.prefs.getDouble('Lat') ?? defaultLat;
            widget.lang = Providers.prefs.getDouble('Long') ?? defaultLong;
          }
          // context.read<MerchantListBloc>().add(MerchantListRequestEvent(
          //       merchantType: 1,
          //       lat: widget.lat,
          //       lng: widget.lang,
          //     ));
        } else if (state is LocationError) {
          print('state is error *** ${state.message}');
          // CustomModal.showError(context, state.message);
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
                  height: 40,
                  width: 40,
                  child: IconButton(
                    icon: Assets.icons.svgexport7.svg(),
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
                        (state is LocationLoading || state is LocationInitial)
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
                                                lat: Providers.prefs
                                                        .getDouble('Lat') ??
                                                    widget.lat ??
                                                    defaultLat,
                                                lang: Providers.prefs
                                                        .getDouble('Long') ??
                                                    widget.lang ??
                                                    defaultLong,
                                                cityName: state.location.city ??
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
                                                lat: Providers.prefs
                                                        .getDouble('Lat') ??
                                                    state.locationData!
                                                        .latitude!,
                                                lang: Providers.prefs
                                                        .getDouble('Long') ??
                                                    state.locationData!
                                                        .longitude!,
                                                cityName: state.location.city ??
                                                    state.location.county ??
                                                    '',
                                              ),
                                            ));
                                      }
                                    },
                                    child: Container(
                                        margin: const EdgeInsets.only(
                                          left: 30,
                                        ),
                                        child: const Icon(
                                            Icons.location_on_sharp)),
                                  )
                                : state is LocationError
                                    ? Text(state.message)
                                    : const Text(''),
                      ],
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Row(
                      children: [
                        const Text(
                          'آدرس',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                            left: 45,
                          ),
                          width: 10,
                          height: 10,
                          child: Assets.icons.svgexport23.svg(),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
