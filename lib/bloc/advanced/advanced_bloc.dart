import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'advanced_event.dart';
part 'advanced_state.dart';

class AdvancedBloc extends Bloc<AdvancedEvent, AdvancedState> {
  AdvancedBloc() : super(AdvancedInitialState()) {
    on<ShowAdvancedEvent>((event, emit) async {
      emit(AdvancedLoadingState());
      await Future.delayed(const Duration(seconds: 2));
      emit(
        const AdvancedHasDataState(
          message: 'Advanced Data Loaded',
          status: true,
        ),
      );
    });
    on<AddAdvancedEvent>((event, emit) {});
    on<UpdateAdvancedEvent>((event, emit) {});
    on<DeleteAdvancedEvent>((event, emit) {});
  }
}
