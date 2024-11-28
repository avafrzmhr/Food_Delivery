import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/views/customers/profile/bloc/profile_bloc.dart';

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
      child: Scaffold(
        body: BlocBuilder<CustomerProfileBloc, CustomerProfileState>(
          builder: (context, state) {
            if (state is CustomerProfileSuccess) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      'ادرس: ${state.profile[0].addressName}',
                      style: const TextStyle(
                        color: Color.fromRGBO(48, 24, 172, 1),
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      ' ${state.profile[0].user.name}:نام',
                      style: const TextStyle(
                        color: Color.fromRGBO(48, 24, 172, 1),
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      ' ${state.profile[0].user.lastName}:نام خانوادگی',
                      style: const TextStyle(
                        color: Color.fromRGBO(48, 24, 172, 1),
                      ),
                    ),
                  ),
                ],
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
