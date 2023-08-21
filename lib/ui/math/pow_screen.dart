import 'package:block_cubit/cubit/math/pow_cubit.dart';
import 'package:block_cubit/cubit/math/pow_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PowScreen extends StatefulWidget {
  const PowScreen({super.key});

  @override
  State<PowScreen> createState() => _PowScreenState();
}

class _PowScreenState extends State<PowScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pow Screen"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r"[0-9]")),
                LengthLimitingTextInputFormatter(4),
              ],
              onChanged: (value) {
                if (value.isNotEmpty) {
                  context.read<PowCubit>().numberA(int.parse(value));
                  context.read<PowCubit>().answer();
                }
              },
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: "Enter Number A"),
            ),
            const SizedBox(height: 30,),
            TextField(
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r"[0-9]")),
                LengthLimitingTextInputFormatter(3),
              ],
              onChanged: (value) {
                if (value.isNotEmpty) {
                  context.read<PowCubit>().numberB(int.parse(value));
                  context.read<PowCubit>().answer();
                }
              },
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: "Enter Number B"),
            ),
            const SizedBox(
              height: 100,
            ),
            BlocBuilder<PowCubit, PowState>(builder: (context, state) {
              int count=0;
              String number='';
              String num = context.read<PowCubit>().state.answer.toString();
              for(int i=0;i<num.length;i++){
                if(count==3){
                  number+=' ';
                  count=0;
                }
                number+=num[i];
                if(num[i]!='-') {
                  count++;
                }
              }
              return Visibility(
                visible: context.read<PowCubit>().state.answer != 1,
                child: Center(
                  child: Text(
                    number,
                    // context.read<PowCubit>().state.answer.toString(),
                    style: const TextStyle(fontSize: 32),
                  ),
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}