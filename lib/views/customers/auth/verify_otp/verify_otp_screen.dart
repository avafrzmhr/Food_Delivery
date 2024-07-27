import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/data/repository/auth_repository.dart';
import 'package:food_delivery/data/source/auth_data_source.dart';
import 'package:food_delivery/providers.dart';
import 'package:food_delivery/views/customers/auth/verify_otp/bloc/verify_otp_bloc.dart';
import 'package:food_delivery/views/owners/home/owner_home.dart';
import 'package:food_delivery/views/tabs_screen.dart';
import 'package:pinput/pinput.dart';

// ignore: must_be_immutable
class VerifyOTPScreen extends StatefulWidget {
  bool isOwner = false;
  VerifyOTPScreen({super.key, required this.isOwner});

  @override
  State<VerifyOTPScreen> createState() => _VerifyOTPScreenState();
}

class _VerifyOTPScreenState extends State<VerifyOTPScreen> {
  final pinController = TextEditingController();
  final focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    context.read<Providers>().init(context);
    return LayoutBuilder(builder: (context, constraints) {
      return BlocProvider(
        create: (context) => VerifyOtpBloc(AuthRepository(AuthDataSource())),
        child: Scaffold(
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
                  child: Text(
                    'کد تایید به شماره ${Providers.prefs.getString('phone_number')} ارسال شد',
                    style: const TextStyle(
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
                    length: 6,
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
                        border: Border.all(
                            color: const Color.fromARGB(255, 48, 24, 172)),
                      ),
                    ),
                    controller: pinController,
                    focusNode: focusNode,
                    androidSmsAutofillMethod:
                        AndroidSmsAutofillMethod.smsUserConsentApi,
                    listenForMultipleSmsOnAndroid: true,
                    hapticFeedbackType: HapticFeedbackType.lightImpact,
                    onCompleted: (String verificationCode) {
                      print(pinController.text);
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
                BlocListener<VerifyOtpBloc, VerifyOtpState>(
                  listener: (context, state) {
                    if (state is VerifyOtpSuccess) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return !widget.isOwner
                            ? TabsScreen()
                            : OwnerHomeScreen();
                      }));
                    }
                  },
                  child: BlocBuilder<VerifyOtpBloc, VerifyOtpState>(
                    builder: (context, state) {
                      return Center(
                        child: SizedBox(
                          width: constraints.maxWidth * 0.4,
                          height: 60,
                          child: ElevatedButton(
                            onPressed: () {
                              BlocProvider.of<VerifyOtpBloc>(context).add(
                                  VerifyOtpRequestEvent(
                                      Providers.prefs
                                              .getString('phone_number') ??
                                          '',
                                      pinController.text));
                            },
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              backgroundColor:
                                  const Color.fromARGB(255, 48, 24, 172),
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
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
