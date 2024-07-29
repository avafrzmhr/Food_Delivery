import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:food_delivery/data/model/restaurant/restaurant_response.dart';
import 'package:food_delivery/providers.dart';
import 'package:food_delivery/views/customers/home/res_bloc/restaurant_bloc.dart';

class SearchBarWidget extends StatefulWidget {
  final BoxConstraints constraints;
  final void Function(RestaurantModel) onSuggestionSelected;

  const SearchBarWidget(this.constraints,
      {super.key, required this.onSuggestionSelected});

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  List<RestaurantModel> restaurants = [];

  final TextEditingController _textController = TextEditingController();
  double _turn = 1;
  final ScrollController _scrollController =
      ScrollController(debugLabel: "LocationSearchField-scroll");

  @override
  Widget build(BuildContext context) {
    context.read<Providers>().init();

    return BlocProvider(
      create: (context) => RestaurantBloc(),
      child: BlocBuilder<RestaurantBloc, RestaurantState>(
        builder: (context, state) {
          return LayoutBuilder(builder: (context, constraints) {
            return Container(
              margin: const EdgeInsets.only(top: 30),
              // padding: const EdgeInsets.only(top: 30),
              width: constraints.maxWidth * 0.9,
              height: 50,
              child: TypeAheadField(
                hideOnLoading: false,
                noItemsFoundBuilder: (context) => Container(),
                scrollController: _scrollController,
                suggestionsBoxDecoration: SuggestionsBoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                textFieldConfiguration: TextFieldConfiguration(
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.right,
                  controller: _textController,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintStyle: const TextStyle(color: Colors.grey),
                    hintText: 'جستجو',
                    contentPadding: const EdgeInsets.all(8),
                    prefixIcon: _textController.text.isNotEmpty
                        ? InkWell(
                            onTap: () {
                              setState(() {
                                _textController.clear();
                              });
                            },
                            child: const Icon(
                              Icons.close,
                              color: Colors.red,
                            ),
                          )
                        : null,
                    suffixIcon: const Icon(
                      Icons.search_rounded,
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade100),
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade100),
                        borderRadius: BorderRadius.circular(10)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade100),
                        borderRadius: BorderRadius.circular(10)),
                    disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade100),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                itemBuilder: (context, suggestion) {
                  return ListTile(
                    title: Padding(
                      padding: const EdgeInsets.only(right: 30),
                      child: Text(
                        suggestion.name,
                        textDirection: TextDirection.rtl,
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  );
                },
                suggestionsCallback: (pattern) async {
                  BlocProvider.of<RestaurantBloc>(context)
                      .add(LoadRestaurantEvent());
                  if (state is RestaurantSuccess) {
                    restaurants = state.restaurants.data;
                  }
                  return restaurants;
                },
                onSuggestionsBoxToggle: (p0) {
                  setState(() {
                    _turn == 1 ? _turn = 0.5 : _turn = 1;
                  });
                },
                onSuggestionSelected: (suggestion) {
                  _textController.text = suggestion.name;
                  widget.onSuggestionSelected(suggestion);
                },
              ),
            );
          });
        },
      ),
    );
  }
}
