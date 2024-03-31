import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class VerifyOTPScreen extends StatefulWidget {
  const VerifyOTPScreen({super.key});

  @override
  State<VerifyOTPScreen> createState() => _VerifyOTPScreenState();
}

class _VerifyOTPScreenState extends State<VerifyOTPScreen> {
  final pinController = TextEditingController();
  final focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 10, right: 25, left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.arrow_back),
              Container(
                alignment: AlignmentDirectional.topEnd,
                child: const Text(
                  textDirection: TextDirection.rtl,
                  'کد تایید خود را وارد کنید',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                alignment: AlignmentDirectional.topEnd,
                child: const Text(
                  'کد تایید به شماره ۰۹۵۴۴۵۴ ارسال شد',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                ),
              ),
              SizedBox(
                height: constraints.maxHeight * 0.12,
              ),
              Center(
                child: Pinput(
                  defaultPinTheme: PinTheme(
                    margin: const EdgeInsets.all(3),
                    width: 65,
                    height: 70,
                    textStyle: const TextStyle(
                      fontSize: 22,
                      color: Color.fromRGBO(30, 60, 87, 1),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(19),
                      border:
                          Border.all(color: Color.fromARGB(255, 48, 24, 172)),
                    ),
                  ),
                  controller: pinController,
                  focusNode: focusNode,
                  androidSmsAutofillMethod:
                      AndroidSmsAutofillMethod.smsUserConsentApi,
                  listenForMultipleSmsOnAndroid: true,
                  hapticFeedbackType: HapticFeedbackType.lightImpact,
                  onCompleted: (String verificationCode) {
                    // debugPrint('onCompleted: $pin');
                  },
                  onChanged: (code) {
                    // debugPrint('onChanged: $value');
                  },
                  cursor: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 9),
                        width: 22,
                        height: 1,
                        color: const Color.fromARGB(255, 48, 24, 172),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: constraints.maxHeight * 0.3,
              ),
              Center(
                child: SizedBox(
                  width: constraints.maxWidth * 0.4,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      backgroundColor: const Color.fromARGB(255, 48, 24, 172),
                    ),
                    child: const Text(
                      'تایید',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 17),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
