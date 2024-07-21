import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/data/model/neshan/neshan_search_address_request.dart';
import 'package:food_delivery/data/model/neshan/neshan_search_response/item.dart';
import 'package:food_delivery/data/repository/location_repository.dart';
import 'package:food_delivery/data/source/location_source.dart';
import 'package:food_delivery/providers.dart';
import 'package:food_delivery/views/location/bloc/location_bloc.dart';
import 'package:food_delivery/views/location/location_serchfield/bloc/location_search_field_bloc.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class LocationSearchField extends StatefulWidget {
  final void Function(Item) onSuggestionSelected;
  final void Function() onClearSearch;

  final NeshanSearchAddressRequest request;
  const LocationSearchField({
    super.key,
    required this.onSuggestionSelected,
    required this.onClearSearch,
    required this.request,
  });

  @override
  State<LocationSearchField> createState() => _LocationSearchFieldState();

  static List<Item>? guildGroupListCache;
}

class _LocationSearchFieldState extends State<LocationSearchField> {
  final TextEditingController _textController = TextEditingController();
  List<Item> items = [];
  LocationSearchFieldBloc _bloc =
      LocationSearchFieldBloc(LocationRepository(LocationDataSource()));

  double _turn = 1;
  final ScrollController _scrollController =
      ScrollController(debugLabel: "LocationSearchField-scroll");

  @override
  void initState() {
    super.initState();
    _bloc = LocationSearchFieldBloc(LocationRepository(LocationDataSource()));
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        items = LocationSearchField.guildGroupListCache ?? [];
      });
    });

    // Listen to changes in the text controller
    _textController.addListener(() {
      _onTextChanged(_textController.text);
    });
  }

  void _onTextChanged(String text) {
    print('Text changed: $text');
    if (text.isNotEmpty) {
      final request = NeshanSearchAddressRequest(
        address: text,
        lat: widget.request.lat,
        lang: widget.request.lang,
      );
      _bloc.add(LoactionSearchFieldEditEvent(request));
    }
  }

  @override
  Widget build(BuildContext context) {
    context.read<Providers>().init(context);
    return BlocProvider(
      create: (context) {
        return _bloc;
      },
      child: BlocConsumer<LocationSearchFieldBloc, LocationSearchFieldState>(
        buildWhen: (previous, current) => previous != current,
        listenWhen: (previous, current) => previous != current,
        listener: (context, state) {
          if (state is LocationSearchFieldSuccess) {
            setState(() {
              LocationSearchField.guildGroupListCache = state.response;
              items = state.response;
            });
          }
          if (state is LocationSearchFieldError) {
            print(state.message);
          }
        },
        builder: (context, state) {
          return TypeAheadField(
            hideOnLoading: false,
            noItemsFoundBuilder: (context) => Container(),
            scrollController: _scrollController,
            suggestionsBoxDecoration: SuggestionsBoxDecoration(
              color: Color.fromRGBO(48, 24, 172, 1),
              borderRadius: BorderRadius.circular(8),
            ),
            textFieldConfiguration: TextFieldConfiguration(
              controller: _textController,
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                hintStyle: const TextStyle(color: Colors.grey),
                hintText: 'جستجوی آدرس',
                contentPadding: const EdgeInsets.all(8),
                prefixIcon: _textController.text.isNotEmpty
                    ? InkWell(
                        onTap: () {
                          widget.onClearSearch();
                          setState(() {
                            _textController.clear();
                          });
                        },
                        child: const Icon(
                          Icons.close,
                          color: Colors.red,
                        ),
                      )
                    : const Icon(Icons.search_rounded),
                suffixIcon: state is LocationSearchFieldLoading
                    ? const Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: CupertinoActivityIndicator(),
                          ),
                        ],
                      )
                    : AnimatedRotation(
                        turns: _turn,
                        duration: const Duration(milliseconds: 200),
                        child: const Icon(Icons.keyboard_arrow_down_rounded)),
                // border: borderStyle(borderRadius: 8),
                // focusedBorder: borderStyle(borderRadius: 8),
                // enabledBorder: borderStyle(borderRadius: 8),
                // disabledBorder: borderStyle(borderRadius: 8),
                // focusedErrorBorder: borderStyle(
                //   borderRadius: 8,
                //   color: App.theme.value.colors.colorError,
                // ),
              ),
            ),
            itemBuilder: (context, suggestion) {
              return ListTile(
                title: Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: Text(
                    suggestion.title ?? '',
                    textDirection: TextDirection.rtl,
                  ),
                ),
              );
            },
            suggestionsCallback: (pattern) async {
              final request = NeshanSearchAddressRequest(
                  address: pattern,
                  lat: widget.request.lat,
                  lang: widget.request.lang);
              BlocProvider.of<LocationSearchFieldBloc>(context)
                  .add(LoactionSearchFieldEditEvent(request));
              return items;
            },
            onSuggestionsBoxToggle: (p0) {
              setState(() {
                _turn == 1 ? _turn = 0.5 : _turn = 1;
              });
            },
            onSuggestionSelected: (suggestion) {
              _textController.text = suggestion.title ?? '';
              widget.onSuggestionSelected(suggestion);
            },
          );
        },
      ),
    );
  }
}
