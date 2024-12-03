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
  // Text controllers
  TextEditingController cardNumController = TextEditingController();
  TextEditingController cvv2Controller = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController verificationController = TextEditingController();

  // State for showing extra fields
  bool showExtraFields = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PaymentBloc(),
      child: Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Card number field
                  TextFieldRowWidget(
                    label: '',
                    suffixText: '',
                    controller: cardNumController,
                    constraints: constraints,
                    width: constraints.maxWidth * 0.65,
                    text: 'شماره کارت',
                  ),
                  // CVV2 field
                  TextFieldRowWidget(
                    label: '',
                    suffixText: '',
                    controller: cvv2Controller,
                    constraints: constraints,
                    width: 100,
                    text: 'cvv2',
                  ),
                  // Extra fields (conditionally displayed)
                  if (showExtraFields) ...[
                    TextFieldRowWidget(
                      label: '',
                      suffixText: '',
                      controller: passController,
                      constraints: constraints,
                      width: constraints.maxWidth * 0.65,
                      text: 'رمز پویا',
                    ),
                    TextFieldRowWidget(
                      label: '',
                      suffixText: '',
                      controller: verificationController,
                      constraints: constraints,
                      width: constraints.maxWidth * 0.65,
                      text: 'عبارت امنیتی',
                    ),
                  ],
                  // Listener for payment state
                  BlocListener<PaymentBloc, PaymentState>(
                    listener: (context, state) {
                      if (state is PaymentSuccess) {
                        setState(() {
                          showExtraFields = true;
                          // Optionally auto-fill verification field
                          // verificationController.text = state.response.data['verification'] ?? '';
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.green,
                            content: const Text('پرداخت با موفقیت انجام شد'),
                          ),
                        );
                      } else if (state is VerifyPaymentSuccess) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.green,
                            content: const Text('تأیید پرداخت موفق بود'),
                          ),
                        );
                      } else if (state is PaymentError) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.red,
                            content: Text('خطا: ${state.message}'),
                          ),
                        );
                      }
                    },
                    child: BlocBuilder<PaymentBloc, PaymentState>(
                      builder: (context, state) {
                        bool isLoading = state is PaymentLoading;

                        return Container(
                          width: constraints.maxWidth * 0.5,
                          padding: const EdgeInsets.only(bottom: 15),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromRGBO(48, 24, 172, 1),
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            onPressed: isLoading
                                ? null // Disable button while loading
                                : () {
                                    if (!showExtraFields) {
                                      // Dispatch AddPaymentEvent
                                      BlocProvider.of<PaymentBloc>(context).add(
                                        AddPaymentEvent(
                                          widget.orderID,
                                          cardNumController.text,
                                          cvv2Controller.text,
                                        ),
                                      );
                                    } else {
                                      // Dispatch VerifyPayment event when extra fields are visible
                                      BlocProvider.of<PaymentBloc>(context).add(
                                        VerifyPayment(
                                          widget.orderID,
                                          cardNumController.text,
                                          cvv2Controller.text,
                                          passController.text,
                                          verificationController.text,
                                        ),
                                      );
                                    }
                                  },
                            child: isLoading
                                ? CircularProgressIndicator(
                                    color: Colors.white,
                                  )
                                : Text(
                                    showExtraFields ? 'تأیید پرداخت' : 'پرداخت',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17,
                                    ),
                                  ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
