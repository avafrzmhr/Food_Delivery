import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/views/customers/profile/bloc/profile_bloc.dart';
import 'package:food_delivery/views/customers/profile/edit_profile.dart';

class CustomerProfileScreen extends StatefulWidget {
  const CustomerProfileScreen({super.key});

  @override
  State<CustomerProfileScreen> createState() => _CustomerProfileScreenState();
}

class _CustomerProfileScreenState extends State<CustomerProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CustomerProfileBloc()..add(const LoadCustomerProfile()),
      child: BlocBuilder<CustomerProfileBloc, CustomerProfileState>(
        builder: (context, state) {
          if (state is CustomerProfileSuccess) {
            return Scaffold(
                floatingActionButton: FloatingActionButton.extended(
                  label: const Text('ادیت'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            EditProfileScreen(state.profile[0].id),
                      ),
                    );
                  },
                  icon: const Icon(Icons.edit,
                      color: Color.fromRGBO(48, 24, 172, 1), size: 28),
                ),
                body: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(224, 218, 255, 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          'ایمیل: ${state.profile[0].user.email}',
                          style: const TextStyle(
                            color: Color.fromRGBO(48, 24, 172, 1),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(224, 218, 255, 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          ' ${state.profile[0].user.name}:نام',
                          style: const TextStyle(
                            color: Color.fromRGBO(48, 24, 172, 1),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(224, 218, 255, 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          ' ${state.profile[0].user.lastName}:نام خانوادگی',
                          style: const TextStyle(
                            color: Color.fromRGBO(48, 24, 172, 1),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(224, 218, 255, 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          'شماره تلفن: ${state.profile[0].user.phoneNumber}',
                          style: const TextStyle(
                            color: Color.fromRGBO(48, 24, 172, 1),
                          ),
                        ),
                      ),
                    ),
                  ],
                ));
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
