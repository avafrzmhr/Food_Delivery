import 'package:flutter/material.dart';
import 'package:food_delivery/views/auth/get_mobile/widgets/auth_textfield_widget.dart';

class GetMobileScreen extends StatefulWidget {
  const GetMobileScreen({super.key});

  @override
  State<GetMobileScreen> createState() => _GetMobileScreenState();
}

class _GetMobileScreenState extends State<GetMobileScreen> {
  var _isLogin = true;
  TextEditingController lastNameController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileNumController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
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
                        const SizedBox(
                          height: 50,
                        ),
                        Center(
                          child: SizedBox(
                            width: constraints.maxHeight * 0.3,
                            height: 55,
                            child: ElevatedButton(
                              onPressed: () {},
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
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}
