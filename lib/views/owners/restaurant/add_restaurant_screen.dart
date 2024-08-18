import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/main.dart';
import 'package:food_delivery/views/location/location_screen.dart';
import 'package:food_delivery/views/owners/restaurant/add_res_bloc/add_restaurant_bloc.dart';
import 'package:food_delivery/views/owners/restaurant/widgets/textfield_row_widget.dart';

class AddRestaurantScreen extends StatefulWidget {
  const AddRestaurantScreen({super.key});

  @override
  State<AddRestaurantScreen> createState() => _AddRestaurantScreenState();
}

class _AddRestaurantScreenState extends State<AddRestaurantScreen> {
  List<String> list = [
    'iranian',
    'fastfood',
    'kebab',
    'piza',
    'burger',
    'sandwich',
    'fried',
    'pasta',
    'salad',
    'marine',
    'International',
    'Gilani'
  ];

  File? imagevalue;
  File? file1;
  TextEditingController deliveryTimeController = TextEditingController();
  TextEditingController deliveryPriceController = TextEditingController();
  TextEditingController minPriceController = TextEditingController();
  TextEditingController numController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController openTimeController = TextEditingController();
  TextEditingController closeTimeController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  String? fileName;
  TimeOfDay timeOfDay = TimeOfDay.now();

  Future<void> uploadImage() async {
    print('Opening file picker...');
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );

    if (result != null) {
      setState(() {
        imagevalue = File(result.files.single.path!);
      });
    } else {
      print('No image selected.');
    }
  }

  @override
  Widget build(BuildContext context) {
    var dropdownValue = list[0];
    return BlocProvider(
      create: (context) => AddRestaurantBloc(),
      child: LayoutBuilder(builder: (context, constraints) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('منوی اضافه کردن رستوران'),
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: ListView(
              padding: const EdgeInsets.all(10),
              physics: const BouncingScrollPhysics(),
              children: [
                Container(
                    child: imagevalue == null
                        ? const Text('No Image')
                        : Image.file(imagevalue!)),
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: 150,
                    height: 40,
                    child: ElevatedButton(
                        onPressed: () => uploadImage(),
                        child: const Text("انتخاب عکس")),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    DropdownMenu<String>(
                      width: 150,
                      inputDecorationTheme: InputDecorationTheme(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                      ),
                      initialSelection: list.first,
                      onSelected: (String? value) {
                        // This is called when the user selects an item.
                        setState(() {
                          dropdownValue = value!;
                        });
                      },
                      dropdownMenuEntries:
                          list.map<DropdownMenuEntry<String>>((String value) {
                        return DropdownMenuEntry<String>(
                            value: value, label: value);
                      }).toList(),
                    ),
                    const SizedBox(width: 8),
                    const Text(':نوع رستوران خود را مشخص کنید'),
                  ],
                ),
                TextFieldRowWidget(
                  width: 100,
                  controller: nameController,
                  constraints: constraints,
                  text: ':نام',
                  suffixText: '',
                  label: '',
                ),
                TextFieldRowWidget(
                  width: 130,
                  controller: deliveryPriceController,
                  constraints: constraints,
                  text: ':هزینه سفارش',
                  suffixText: 'تومان',
                  label: '',
                ),
                TextFieldRowWidget(
                  width: 130,
                  controller: minPriceController,
                  constraints: constraints,
                  text: ':حداقل قیمت سفارش',
                  suffixText: 'تومان',
                  label: '',
                ),
                TextFieldRowWidget(
                  width: 100,
                  controller: deliveryTimeController,
                  constraints: constraints,
                  text: ':زمان تحویل',
                  label: '',
                  suffixText: 'دقیقه',
                ),
                TextFieldRowWidget(
                  width: constraints.maxWidth * 0.7,
                  controller: numController,
                  constraints: constraints,
                  text: ':شماره تلفن',
                  suffixText: '',
                  label: '',
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: 100,
                      height: 40,
                      child: ElevatedButton(
                          onPressed: () =>
                              displayTimePicker(context, openTimeController),
                          child: const Text("انتخاب")),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    TextFieldRowWidget(
                        width: constraints.maxWidth * 0.4,
                        controller: openTimeController,
                        constraints: constraints,
                        text: ':زمان باز شدن',
                        suffixText: '',
                        label: 'Time picker'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: 100,
                      height: 40,
                      child: ElevatedButton(
                          onPressed: () =>
                              displayTimePicker(context, closeTimeController),
                          child: const Text("انتخاب")),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    TextFieldRowWidget(
                        width: constraints.maxWidth * 0.38,
                        controller: closeTimeController,
                        constraints: constraints,
                        text: ':زمان بسته شدن',
                        suffixText: '',
                        label: 'Time picker'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: constraints.maxWidth * 0.75,
                      child: TextField(
                        controller: addressController,
                        textAlign: TextAlign.end,
                        style: const TextStyle(),
                        maxLines: 2,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(
                              color: Color.fromRGBO(48, 24, 172, 1),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(':آدرس'),
                  ],
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    padding: const EdgeInsets.only(top: 10),
                    height: 60,
                    width: 180,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LocationScreen(
                                lat: MyApp.sharedPreferences.getDouble('Lat') ??
                                    MyApp.defaultLat,
                                lang:
                                    MyApp.sharedPreferences.getDouble('Long') ??
                                        MyApp.defaultLong,
                                cityName: '',
                              ),
                            ),
                          ).then((_) {
                            // This block will be executed when the LocationScreen is popped
                            setState(() {
                              addressController.text = MyApp.sharedPreferences
                                      .getString('Address') ??
                                  '';
                            });
                          });
                        },
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("Pick Address"),
                            Icon(
                              Icons.location_on,
                              color: Color.fromRGBO(48, 24, 172, 1),
                            )
                          ],
                        )),
                  ),
                ),
                BlocListener<AddRestaurantBloc, AddRestaurantState>(
                  listener: (context, state) {
                    setState(() {
                      Navigator.pop(context);
                    });
                  },
                  child: BlocBuilder<AddRestaurantBloc, AddRestaurantState>(
                    builder: (context, state) {
                      return Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          padding: const EdgeInsets.only(top: 20),
                          width: constraints.maxWidth * 0.5,
                          height: 75,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              backgroundColor:
                                  const Color.fromRGBO(48, 24, 172, 1),
                            ),
                            onPressed: () {
                              BlocProvider.of<AddRestaurantBloc>(context)
                                  .add(AddRestaurantRequestEvent(
                                imagevalue!,
                                dropdownValue,
                                deliveryTimeController.text,
                                double.parse(minPriceController.text),
                                double.parse(deliveryPriceController.text),
                                nameController.text,
                                numController.text,
                                openTimeController.text,
                                closeTimeController.text,
                                addressController.text,
                                MyApp.sharedPreferences.getDouble('Lat')!,
                                MyApp.sharedPreferences.getDouble('Long')!,
                              ));

                              if (state is AddRestaurantError) {
                                print(state.message);
                              }
                            },
                            child: const Text(
                              'تایید',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  Future<void> displayTimePicker(
      BuildContext context, TextEditingController timeController) async {
    TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(), // Use the current time as the initial value
    );

    if (time != null) {
      // Format the time as "HH:MM:SS"
      String formattedTime =
          "${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}:00";

      // Set the formatted time string to the controller's text
      setState(() {
        timeController.text = formattedTime;
      });
    }
  }
}
