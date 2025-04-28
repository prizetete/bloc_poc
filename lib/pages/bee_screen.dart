import 'package:bloc_poc/bloc/simple_cubit.dart';
import 'package:bloc_poc/widgets/custom_floating_action_button.dart';
import 'package:bloc_poc/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BeeScreen extends StatelessWidget {
  const BeeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Bee',
      customFloatingActionButton: [
        CustomFloatingActionButton(
          name: '+',
          onPressed: () {
            context.read<SimpleCubit>().increment();
          },
        ),
      ],
      children: [
        Center(
          child: BlocBuilder<SimpleCubit, SimpleState>(
            builder: (context, state) {
              if (state is SimpleLoadingState) {
                return const CircularProgressIndicator();
              } else if (state is SimpleHasDataState) {
                return Text(
                  '${state.message} => ${state.count}',
                  style: TextStyle(fontSize: 24),
                );
              }
              return Text("Hello World", style: TextStyle(fontSize: 24));
            },
          ),
        ),
      ],
    );
  }
}
