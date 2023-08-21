import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/auth/sign_cubit.dart';
import '../../cubit/auth/sign_state.dart';

class SignScreen extends StatefulWidget {
  const SignScreen({super.key});

  @override
  State<SignScreen> createState() => _SignScreenState();
}
class _SignScreenState extends State<SignScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up Screen"),
      ),
      body: BlocBuilder<SignUpCubit, SignUpState>(builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                keyboardType: TextInputType.text,
                controller: context.read<SignUpCubit>().emailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter email",
                ),
              ),
              const SizedBox(height: 20,),
              TextField(
                keyboardType: TextInputType.text,
                controller: context.read<SignUpCubit>().passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter password",
                ),
              ),
              const SizedBox(height: 100),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      onPressed: () {
                          context.read<SignUpCubit>().signUpUser(context);
                          context.read<SignUpCubit>().buttonPressed();
                      },
                      child: const Text("SignUp")),

                  ElevatedButton(
                      onPressed: () {
                        context.read<SignUpCubit>().logInUser(context);
                        context.read<SignUpCubit>().buttonPressed();
                      },
                      child: const Text("LogIn")),

                ],
              ),

            ],
          ),
        );
      }),
    );
  }
}