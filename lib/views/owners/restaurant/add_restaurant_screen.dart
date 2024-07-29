import 'package:flutter/material.dart';
import 'package:food_delivery/views/customers/auth/get_mobile/widgets/auth_textfield_widget.dart';
import 'package:food_delivery/views/owners/restaurant/category_drop_down.dart';
import 'package:food_delivery/views/owners/restaurant/textfield_row_widget.dart';

class AddRestaurantScreen extends StatefulWidget {
  const AddRestaurantScreen({super.key});

  @override
  State<AddRestaurantScreen> createState() => _AddRestaurantScreenState();
}

class _AddRestaurantScreenState extends State<AddRestaurantScreen> {
  TextEditingController deliveryTimeController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController openTimeController = TextEditingController();
  TextEditingController closeTimeController = TextEditingController();

  TimeOfDay timeOfDay = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    // Future<TimeOfDay?> selectedTime24Hour = showTimePicker(
    //   context: context,
    //   initialTime: const TimeOfDay(hour: 10, minute: 47),
    //   builder: (BuildContext context, Widget? child) {
    //     return MediaQuery(
    //       data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
    //       child: child!,
    //     );
    //   },
    // );

    return LayoutBuilder(builder: (context, constraints) {
      return Padding(
        padding: const EdgeInsets.only(top: 10),
        child: ListView(
          padding: const EdgeInsets.all(10),
          physics: BouncingScrollPhysics(),
          children: [
            const CategoryDropDownWidget(),
            TextFieldRowWidget(
              width: 100,
              controller: deliveryTimeController,
              constraints: constraints,
              text: ':زمان تحویل',
              label: '',
              suffixText: 'دقیقه',
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
              width: constraints.maxWidth * 0.75,
              controller: nameController,
              constraints: constraints,
              text: ':شماره تلفن',
              suffixText: '',
              label: '',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: 120,
                  height: 40,
                  child: ElevatedButton(
                      onPressed: () =>
                          displayTimePicker(context, openTimeController),
                      child: const Text("Pick Time")),
                ),
                SizedBox(
                  width: 5,
                ),
                TextFieldRowWidget(
                    width: constraints.maxWidth * 0.5,
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
                  width: 120,
                  height: 40,
                  child: ElevatedButton(
                      onPressed: () =>
                          displayTimePicker(context, closeTimeController),
                      child: const Text("Pick Time")),
                ),
                SizedBox(
                  width: 5,
                ),
                TextFieldRowWidget(
                    width: constraints.maxWidth * 0.5,
                    controller: closeTimeController,
                    constraints: constraints,
                    text: ':زمان بسته شدن',
                    suffixText: '',
                    label: 'Time picker'),
              ],
            ),
          ],
        ),
      );
    });
  }

  Future displayTimePicker(
      BuildContext context, TextEditingController timeController) async {
    var time = await showTimePicker(
      context: context,
      initialTime: timeOfDay,
    );

    if (time != null) {
      setState(() {
        timeController.text = "${time.hour}:${time.minute}";
      });
    }
  }
}
