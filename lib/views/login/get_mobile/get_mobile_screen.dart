import 'package:flutter/material.dart';

class GetMobileScreen extends StatefulWidget {
  const GetMobileScreen({super.key});

  @override
  State<GetMobileScreen> createState() => _GetMobileScreenState();
}

class _GetMobileScreenState extends State<GetMobileScreen> {
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
                  height: constraints.maxHeight * 0.75,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(48, 24, 172, 1),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(60),
                  width: constraints.maxWidth,
                  height: constraints.maxHeight * 0.7,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Form(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text(
                            'ورود',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text(
                            'لطفا شماره تلفن خود را وارد کنید',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(
                            height: 60,
                          ),
                          Center(
                            child: SizedBox(
                              width: constraints.maxWidth * 0.75,
                              child: TextFormField(
                                controller: mobileNumController,
                                decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.all(30),
                                  label: Text('شماره تلفن'),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(25)),
                                    borderSide: BorderSide(
                                      color: Color.fromARGB(255, 48, 24, 172),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: constraints.maxHeight * 0.2,
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
                          )
                        ],
                      ),
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
