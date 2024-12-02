import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/views/customers/payment/bloc/payment_bloc.dart';
import 'package:food_delivery/views/owners/restaurant/widgets/textfield_row_widget.dart';

class PaymentScreen extends StatefulWidget {
  final int orderID;
  const PaymentScreen(this.orderID, {super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  // Initial text field controllers
  TextEditingController cardNumController = TextEditingController();
  TextEditingController cvv2Controller = TextEditingController();

  // Controllers for additional fields
  TextEditingController passController = TextEditingController();
  TextEditingController verificationController = TextEditingController();

  // Track if new fields are shown
  bool showExtraFields = false;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return BlocProvider(
        create: (context) => PaymentBloc(),
        child: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Original text fields
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
              // Conditionally show extra text fields
              if (showExtraFields) ...[
                TextFieldRowWidget(
                  label: '',
                  suffixText: '',
                  controller: passController,
                  constraints: constraints,
                  width: constraints.maxWidth * 0.65,
                  text: 'اضافی 1',
                ),
                TextFieldRowWidget(
                  label: '',
                  suffixText: '',
                  controller: verificationController,
                  constraints: constraints,
                  width: constraints.maxWidth * 0.65,
                  text: 'اضافی 2',
                ),
              ],
              BlocBuilder<PaymentBloc, PaymentState>(
                builder: (context, state) {
                  return Center(
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
                        onPressed: () {
                          BlocProvider.of<PaymentBloc>(context).add(
                            AddPaymentEvent(
                              widget.orderID,
                              cardNumController.text,
                              cvv2Controller.text,
                            ),
                          );
                          state is PaymentSuccess
                              ? setState(() {
                                  if (!showExtraFields) {
                                    showExtraFields = true;
                                  }
                                })
                              : CircularProgressIndicator();

                          // Example: dispatch event (optional)
                        },
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
                  );
                },
              ),
            ],
          ),
        ),
      );
    });
  }
}
