import 'package:flutter/material.dart';
import 'package:food_delivery/views/owners/restaurant/widgets/textfield_row_widget.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  TextEditingController cardNumController = TextEditingController();
  TextEditingController cvv2Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFieldRowWidget(
              label: '',
              suffixText: '',
              controller: cardNumController,
              constraints: constraints,
              width: constraints.maxWidth * 0.65,
              text: 'شماره کارت',
            ),
            TextFieldRowWidget(
              label: '',
              suffixText: '',
              controller: cvv2Controller,
              constraints: constraints,
              width: 100,
              text: 'cvv2',
            ),
            Center(
              child: Container(
                width: constraints.maxWidth * 0.5,
                padding: const EdgeInsets.only(bottom: 15),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(48, 24, 172, 1),
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'پرداخت',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
