import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/data/repository/auth_repository.dart';
import 'package:food_delivery/data/source/auth_data_source.dart';
import 'package:food_delivery/providers.dart';
import 'package:food_delivery/views/customers/auth/get_mobile/bloc/login/bloc/login_bloc.dart';
import 'package:food_delivery/views/customers/auth/get_mobile/bloc/register/register_bloc.dart';
import 'package:food_delivery/views/customers/auth/get_mobile/widgets/auth_textfield_widget.dart';
import 'package:food_delivery/views/customers/auth/verify_otp/verify_otp_screen.dart';
import 'package:food_delivery/views/owners/auth/owner_register_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  var _isLogin = true;
  TextEditingController lastNameController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileNumController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // final ownerProvider = Provider.of<OwnerProvider>(context);
    context.read<Providers>().init();

    return LayoutBuilder(builder: (context, constraints) {
      return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => RegisterBloc(AuthRepository(AuthDataSource())),
          ),
          BlocProvider(
            create: (context) => LoginBloc(AuthRepository(AuthDataSource())),
          ),
        ],
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Stack(
                alignment: AlignmentDirectional.bottomEnd,
                children: [
                  Container(
                    height: constraints.maxHeight * 0.77,
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(48, 24, 172, 1),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                  ),
                  Container(
                    width: constraints.maxWidth,
                    height: constraints.maxHeight * 0.72,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: ListView(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 30),
                            child: Text(
                              textAlign: TextAlign.end,
                              _isLogin ? 'ورود' : 'ثبت نام',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          // const Padding(
                          //   padding: EdgeInsets.only(right: 30),
                          //   child: Text(
                          //     'لطفا شماره تلفن خود را وارد کنید',
                          //     style: TextStyle(
                          //       color: Colors.grey,
                          //       fontSize: 18,
                          //     ),
                          //   ),
                          // ),
                          const SizedBox(
                            height: 45,
                          ),
                          AuthTextFieldWidget(
                              keyboardType: TextInputType.number,
                              width: constraints.maxWidth * 0.75,
                              controller: mobileNumController,
                              constraints: constraints,
                              label: 'شماره تلفن'),
                          if (!_isLogin)
                            AuthTextFieldWidget(
                                keyboardType: TextInputType.name,
                                width: constraints.maxWidth * 0.75,
                                controller: nameController,
                                constraints: constraints,
                                label: 'نام'),
                          if (!_isLogin)
                            AuthTextFieldWidget(
                                keyboardType: TextInputType.name,
                                width: constraints.maxWidth * 0.75,
                                controller: lastNameController,
                                constraints: constraints,
                                label: 'نام خانوادگی'),
                          const SizedBox(
                            height: 50,
                          ),
                          Center(
                            child: SizedBox(
                              width: constraints.maxHeight * 0.3,
                              height: 55,
                              child: MultiBlocListener(
                                listeners: [
                                  BlocListener<RegisterBloc, RegisterState>(
                                    listener: (context, state) {
                                      if (state is RegisterSuccess) {
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return const VerifyOTPScreen();
                                        }));
                                      }
                                    },
                                  ),
                                  BlocListener<LoginBloc, LoginState>(
                                    listener: (context, state) {
                                      if (state is LoginSuccess) {
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return const VerifyOTPScreen();
                                        }));
                                      }
                                    },
                                  ),
                                ],
                                child: BlocBuilder<RegisterBloc, RegisterState>(
                                  builder: (context, state) {
                                    return ElevatedButton(
                                      onPressed: () {
                                        _isLogin
                                            ? BlocProvider.of<LoginBloc>(
                                                    context)
                                                .add(SubmitLoginEvent(
                                                    mobileNumController.text))
                                            : BlocProvider.of<RegisterBloc>(
                                                    context)
                                                .add(SubmitRegisterEvent(
                                                    nameController.text,
                                                    lastNameController.text,
                                                    mobileNumController.text));
                                      },
                                      style: ElevatedButton.styleFrom(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 15),
                                        backgroundColor: const Color.fromARGB(
                                            255, 48, 24, 172),
                                      ),
                                      child: const Text(
                                        'ادامه',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Center(
                            child: TextButton(
                                onPressed: () {
                                  setState(() {
                                    _isLogin = !_isLogin;
                                  });
                                },
                                child: _isLogin
                                    ? const Text(
                                        'حسابی ندارید؟برای ایجاد حساب اینجا کلیک کنید')
                                    : const Text(
                                        'حسابی دارید؟برای ورود اینجا کلیک کنید')),
                          ),
                          Center(
                            child: TextButton(
                                onPressed: () {
                                  setState(() {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return const OwnerRegisterScreen();
                                    }));
                                  });
                                },
                                child: const Text(
                                    'میخواهید رستوران خود را ثبت کنید؟اینجا کلیک کنید')),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
