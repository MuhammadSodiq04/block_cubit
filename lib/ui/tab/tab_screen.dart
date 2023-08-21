import 'package:block_cubit/cubit/tabCubit/tab_state.dart';
import 'package:block_cubit/ui/math/pow_screen.dart';
import 'package:block_cubit/ui/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/tabCubit/tab_cubit.dart';

class TabScreen extends StatelessWidget {
  const TabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TabCubit,TabState>(builder: (context,state){
      if(state is PowScreenState){
        return const PowScreen();
      }
      return const ProfileScreen();
    }),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        currentIndex: context.watch<TabCubit>().tabIndex,
        onTap: (index){
          context.read<TabCubit>().updateScreen(index: index);
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.calculate),label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person),label: ''),
        ],
      ),
    );
  }
}
