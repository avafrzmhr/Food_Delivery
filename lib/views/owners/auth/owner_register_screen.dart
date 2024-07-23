import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/data/repository/location_repository.dart';
import 'package:food_delivery/data/source/location_source.dart';
import 'package:food_delivery/providers.dart';
import 'package:food_delivery/views/customers/auth/get_mobile/auth_screen.dart';
import 'package:food_delivery/views/customers/auth/get_mobile/widgets/auth_textfield_widget.dart';
import 'package:food_delivery/views/location/bloc/location_bloc.dart';
import 'package:food_delivery/views/location/location_screen.dart';

class OwnerRegisterScreen extends StatefulWidget {
  const OwnerRegisterScreen({super.key});

  @override
  State<OwnerRegisterScreen> createState() => _OwnerRegisterScreenState();
}

class _OwnerRegisterScreenState extends State<OwnerRegisterScreen> {
  var _isLogin = false;
  double defaultLat = 35.6997;
  double defaultLong = 51.3380;
  TextEditingController lastNameController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileNumController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController storeNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    context.read<Providers>().init(context);

    return BlocProvider(
      create: (context) =>
          LocationBloc(LocationRepository(LocationDataSource())),
      child: LayoutBuilder(builder: (context, constraints) {
        return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Stack(
                alignment: AlignmentDirectional.bottomEnd,
                children: [
                  Container(
                    height: constraints.maxHeight * 0.95,
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
                    height: constraints.maxHeight * 0.9,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 30),
                            child: Text(
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
                          const Padding(
                            padding: EdgeInsets.only(right: 30),
                            child: Text(
                              'لطفا شماره تلفن خود را وارد کنید',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 45,
                          ),
                          AuthTextFieldWidget(
                              controller: mobileNumController,
                              constraints: constraints,
                              label: 'شماره تلفن'),
                          if (!_isLogin)
                            AuthTextFieldWidget(
                                controller: nameController,
                                constraints: constraints,
                                label: 'نام'),
                          if (!_isLogin)
                            AuthTextFieldWidget(
                                controller: lastNameController,
                                constraints: constraints,
                                label: 'نام خانوادگی'),
                          if (!_isLogin)
                            AuthTextFieldWidget(
                                controller: emailController,
                                constraints: constraints,
                                label: 'ایمیل'),
                          if (!_isLogin)
                            AuthTextFieldWidget(
                                controller: emailController,
                                constraints: constraints,
                                label: 'نام مکان'),
                          if (!_isLogin)
                            BlocListener<LocationBloc, LocationState>(
                              listener: (context, state) {
                                if (state is LocationSuccess) {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return LocationScreen(
                                      lang: Providers.prefs.getDouble('Long') ??
                                          defaultLong,
                                      lat: Providers.prefs.getDouble('Lat') ??
                                          defaultLat,
                                      cityName:
                                          Providers.prefs.getString('City') ??
                                              '',
                                    );
                                  }));
                                }
                              },
                              child: TextButton(
                                  onPressed: () {
                                    BlocProvider.of<LocationBloc>(context)
                                        .add(LocationStarted());
                                  },
                                  child: Text('address')),
                            ),
                          const SizedBox(
                            height: 50,
                          ),
                          Center(
                            child: SizedBox(
                              width: constraints.maxHeight * 0.3,
                              height: 55,
                              child: ElevatedButton(
                                onPressed: () {
                                  // _isLogin
                                  //     ? BlocProvider.of<LoginBloc>(
                                  //             context)
                                  //         .add(SubmitLoginEvent(
                                  //             mobileNumController.text))
                                  //     : BlocProvider.of<RegisterBloc>(
                                  //             context)
                                  //         .add(SubmitRegisterEvent(
                                  //             nameController.text,
                                  //             lastNameController.text,
                                  //             mobileNumController.text));
                                },
                                style: ElevatedButton.styleFrom(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 15),
                                  backgroundColor:
                                      const Color.fromARGB(255, 48, 24, 172),
                                ),
                                child: const Text(
                                  'ادامه',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17),
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
                                      return const AuthScreen();
                                    }));
                                  });
                                },
                                child: const Text(
                                    'میخواهید به عنوان کاربر وارد شوید اینجا کلیک کنید')),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      }),
    );
  }
}
