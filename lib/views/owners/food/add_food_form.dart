import 'dart:developer';
import 'dart:html' as html;
import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/data/model/restaurant/category_model.dart';
import 'package:food_delivery/views/owners/food/bloc/add_food_bloc.dart';
import 'package:food_delivery/views/owners/food/category_bloc/bloc/category_bloc.dart';
import 'package:food_delivery/views/owners/restaurant/widgets/textfield_row_widget.dart';

class AddFoodForm extends StatefulWidget {
  const AddFoodForm({super.key});

  @override
  State<AddFoodForm> createState() => _AddFoodFormState();
}

class _AddFoodFormState extends State<AddFoodForm> {
  List<String> list = ['Drinks', 'FastFoods'];

  Uint8List? imageBytes;
  File? file1;
  TextEditingController priceController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  String? fileName;

  Future<void> uploadImage() async {
    if (kIsWeb) {
      final html.FileUploadInputElement uploadInput =
          html.FileUploadInputElement()
            ..accept = 'image/*'
            ..multiple = false;

      uploadInput.click();

      uploadInput.onChange.listen((e) async {
        final files = uploadInput.files;
        if (files!.isEmpty) return;

        final reader = html.FileReader();
        reader.readAsArrayBuffer(files[0]!);
        reader.onLoadEnd.listen((e) {
          setState(() {
            imageBytes = reader.result as Uint8List; // Handle as Uint8List
          });
        });
      });
    } else {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.image,
      );

      if (result != null) {
        setState(() {
          imageBytes = result.files.single.bytes; // Use Uint8List directly
        });
      } else {
        log('No image selected.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    CategoryModel? selectedCategory;

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AddFoodBloc(),
        ),
        BlocProvider(
          create: (context) => CategoryBloc(),
        ),
      ],
      child: LayoutBuilder(builder: (context, constraints) {
        return Scaffold(
            appBar: AppBar(
              title: const Text('منوی اضافه کردن آیتم'),
            ),
            body: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: ListView(
                  padding: const EdgeInsets.all(10),
                  physics: const BouncingScrollPhysics(),
                  children: [
                    imageBytes == null
                        ? const Center(
                            child: Text(
                              'No Image Selected',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.grey),
                            ),
                          )
                        : Center(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.memory(
                                imageBytes!,
                                width: constraints.maxWidth * 0.8,
                                height: constraints.maxWidth * 0.8,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                    Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: 150,
                        height: 40,
                        child: ElevatedButton(
                          onPressed: () => uploadImage(),
                          child: const Text("انتخاب عکس"),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    BlocBuilder<CategoryBloc, CategoryState>(
                        builder: (context, state) {
                      BlocProvider.of<CategoryBloc>(context)
                          .add(const LoadCategoryEvent());

                      if (state is CategorySuccess) {
                        selectedCategory ??= state.categoryModel.isNotEmpty
                            ? state.categoryModel[0]
                            : null;

                        return Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            DropdownMenu<CategoryModel>(
                              width: 150,
                              inputDecorationTheme: InputDecorationTheme(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15)),
                              ),
                              initialSelection: selectedCategory,
                              onSelected: (CategoryModel? value) {
                                setState(() {
                                  selectedCategory = value;
                                });
                                if (selectedCategory != null) {
                                  log('Selected Category ID: ${selectedCategory!.id}');
                                }
                              },
                              dropdownMenuEntries: state.categoryModel
                                  .map<DropdownMenuEntry<CategoryModel>>(
                                      (CategoryModel category) {
                                return DropdownMenuEntry<CategoryModel>(
                                  value: category,
                                  label: category.categoryName,
                                );
                              }).toList(),
                            ),
                            const SizedBox(width: 8),
                            const Text(':کتگوری ایتم خود را مشخص کنید'),
                          ],
                        );
                      }
                      return Container();
                    }),
                    TextFieldRowWidget(
                      width: 100,
                      controller: nameController,
                      constraints: constraints,
                      text: ':نام',
                      suffixText: '',
                      label: '',
                    ),
                    TextFieldRowWidget(
                      width: 170,
                      controller: priceController,
                      constraints: constraints,
                      text: ':قیمت',
                      suffixText: 'تومان',
                      label: '',
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: constraints.maxWidth * 0.75,
                          child: TextField(
                            controller: descController,
                            textAlign: TextAlign.end,
                            style: const TextStyle(),
                            maxLines: 2,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
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
                        const Text(':توضیحات'),
                      ],
                    ),
                    BlocListener<AddFoodBloc, AddFoodState>(
                      listener: (context, state) {
                        if (state is AddFoodSuccess) {
                          setState(() {
                            Navigator.pop(context);
                          });
                        }
                        if (state is AddFoodError) {
                          log(state.message);
                        }
                      },
                      child: BlocBuilder<AddFoodBloc, AddFoodState>(
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
                                  BlocProvider.of<AddFoodBloc>(context).add(
                                      AddFoodRequestEvent(
                                          imageBytes!,
                                          selectedCategory!.id,
                                          nameController.text,
                                          descController.text,
                                          double.parse(priceController.text)));
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
                    )
                  ]),
            ));
      }),
    );
  }
}
