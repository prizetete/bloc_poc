import 'package:bloc_poc/bloc/advanced/advanced_bloc.dart';
import 'package:bloc_poc/utils/utils.dart';
import 'package:bloc_poc/widgets/custom_floating_action_button.dart';
import 'package:bloc_poc/widgets/custom_scaffold.dart';
import 'package:bloc_poc/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdvancedScreen extends StatelessWidget {
  const AdvancedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      customFloatingActionButton: [
        CustomFloatingActionButton(
          name: "SHOW",
          onPressed: () {
            context.read<AdvancedBloc>().add(ShowAdvancedEvent());
          },
        ),
      ],
      title: 'DolphinScreen | Advanced BLoC',
      children: [
        BlocConsumer<AdvancedBloc, AdvancedState>(
          listener: (context, state) {
            // todo: implement listener
            // if (state is AdvancedErrorState) {
            //   showDialog(
            //     context: context,
            //     builder: (context) => AlertDialog(
            //       title: CustomText(
            //         state.errorMessage ?? "Somethng went wrong!",
            //         color: Colors.redAccent,
            //       ),
            //       content: const Text(
            //         'Offendit eleifend moderatius ex vix, quem odio mazim et qui, purto expetendis cotidieque quo cu, veri persius vituperata ei nec. Vivendum intellegat et qui, ei denique consequuntur vix.',
            //       ),
            //     ),
            //   );
            // }
          },
          builder: (context, state) {
            if (state is AdvancedLoadingState) {
              return const CircularProgressIndicator();
            }

            if (state is AdvancedErrorState) {
              return const CustomText(
                "Error Somthing weng wrong!",
                color: Colors.red,
              );
            }

            if (state is AdvancedHasDataState) {
              return Padding(
                padding: const EdgeInsets.all(38.0),
                child: CustomText(
                  "Response: ${state.message} \n_______\nStatus: ${state.status}",
                  color: randomColor(),
                ),
              );
            }

            return const CustomText("Example BLoC");
          },
        ),
      ],
    );
  }
}
