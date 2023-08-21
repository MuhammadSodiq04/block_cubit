import 'package:block_cubit/cubit/auth/sign_cubit.dart';
import 'package:block_cubit/cubit/math/pow_cubit.dart';
import 'package:block_cubit/cubit/tabCubit/tab_cubit.dart';
import 'package:block_cubit/data/auth_service.dart';
import 'package:block_cubit/ui/splash/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
        create: (_) => PowCubit(),
        lazy: true,
      ),
      BlocProvider(
        create: (_) => TabCubit(),
        lazy: true,
      ),
      BlocProvider(
        create: (_) => SignUpCubit(firebaseServices: AuthService()),
        lazy: true,
      ),
    ], child: const MainApp());
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen()
    );
  }
}
