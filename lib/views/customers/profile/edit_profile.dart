import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/views/customers/profile/bloc/profile_bloc.dart';
import 'package:food_delivery/views/owners/restaurant/widgets/textfield_row_widget.dart';

class EditProfileScreen extends StatefulWidget {
  final int id;
  const EditProfileScreen(this.id, {super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return BlocProvider(
        create: (context) => CustomerProfileBloc(),
        child: Scaffold(
          body: Column(
            children: [
              TextFieldRowWidget(
                label: '',
                suffixText: '',
                controller: nameController,
                constraints: constraints,
                width: 80,
                text: 'نام',
              ),
              TextFieldRowWidget(
                label: '',
                suffixText: '',
                controller: lastNameController,
                constraints: constraints,
                width: 80,
                text: 'نام خانوادگی',
              ),
              TextFieldRowWidget(
                label: '',
                suffixText: '',
                controller: emailController,
                constraints: constraints,
                width: constraints.maxWidth * 0.5,
                text: 'ایمیل',
              ),
              BlocConsumer<CustomerProfileBloc, CustomerProfileState>(
                listener: (context, state) {
                  if (state is CustomerProfileEditSuccess) {
                    setState(() {
                      Navigator.pop(context);
                    });
                  }
                },
                builder: (context, state) {
                  return Align(
                    alignment: Alignment.bottomCenter,
                    child: ElevatedButton(
                        onPressed: () {
                          BlocProvider.of<CustomerProfileBloc>(context).add(
                              EditProfile(
                                  widget.id,
                                  nameController.text,
                                  lastNameController.text,
                                  emailController.text));
                        },
                        child: Text('تایید')),
                  );
                },
              )
            ],
          ),
        ),
      );
    });
  }
}
