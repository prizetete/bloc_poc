import 'package:bloc_poc/bloc/pai_cubit.dart';
import 'package:bloc_poc/widgets/custom_floating_action_button.dart';
import 'package:bloc_poc/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaiScreen extends StatelessWidget {
  const PaiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Pai',
      customFloatingActionButton: [
        CustomFloatingActionButton(
          onPressed: () {
            context.read<PaiCubit>().addMember();
          },
        ),
        CustomFloatingActionButton(
          name: 'Clear All',
          onPressed: () {
            context.read<PaiCubit>().clearAll();
          },
        ),
      ],
      children: [
        BlocConsumer<PaiCubit, PaiState>(
          listener: (context, state) {
            if (state.customerData.length >= 5) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  duration: Duration(milliseconds: 1000),
                  content: Text('That\'s too much members!'),
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is PaiLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is PaiInitialState) {
              return const Center(child: Text('No data'));
            }
            return Expanded(
              child: ListView.builder(
                itemCount: state.customerData.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      state.customerData[index].name,
                      style: TextStyle(color: Colors.red),
                    ),
                    subtitle: Text(
                      'Salary: ${state.customerData[index].salary}',
                      style: TextStyle(color: Colors.red),
                    ),
                    // trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {},
                  );
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
