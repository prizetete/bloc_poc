import 'package:bloc_poc/bloc/counter_cubit.dart';
import 'package:bloc_poc/widgets/custom_floating_action_button.dart';
import 'package:bloc_poc/widgets/custom_scaffold.dart';
import 'package:bloc_poc/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AntScreen extends StatelessWidget {
  const AntScreen({super.key});
  final localState = 0;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Ant',
      customFloatingActionButton: [
        CustomFloatingActionButton(
          name: '+',
          onPressed: () {
            context.read<CounterCubit>().increment();
          },
        ),
      ],
      children: [
        BlocBuilder<CounterCubit, int>(
          builder: (context, state) {
            return CustomText(state.toString());
          },
        ),
      ],
    );
  }
}
