import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleCubit extends Cubit<SimpleState> {
  SimpleCubit() : super(SimpleInitialState(count: 0, price: 0.0, message: ''));

  increment() async {
    emit(
      SimpleLoadingState(
        count: state.count,
        price: state.price,
        message: 'Loading...',
      ),
    );

    await Future.delayed(const Duration(seconds: 1));

    emit(
      SimpleHasDataState(
        count: state.count + 1,
        price: state.price,
        message: 'Incremented',
      ),
    );
  }
}

abstract class SimpleState {
  final int count;
  final double price;
  final String message;

  SimpleState({
    required this.count,
    required this.price,
    required this.message,
  });
}

class SimpleInitialState extends SimpleState {
  SimpleInitialState({
    required super.count,
    required super.price,
    required super.message,
  });
}

class SimpleLoadingState extends SimpleState {
  SimpleLoadingState({
    required super.count,
    required super.price,
    required super.message,
  });
}

class SimpleHasDataState extends SimpleState {
  SimpleHasDataState({
    required super.count,
    required super.price,
    required super.message,
  });
}
