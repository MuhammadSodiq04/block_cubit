import 'package:block_cubit/cubit/auth/sign_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            context.read<SignUpCubit>().logOutUser(context);
          },
          child: const Text('Log Out'),
        ),
      ),
    );
  }
}
