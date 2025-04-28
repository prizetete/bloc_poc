part of 'advanced_bloc.dart';

sealed class AdvancedEvent extends Equatable {
  const AdvancedEvent();

  @override
  List<Object> get props => [];
}

class ShowAdvancedEvent extends AdvancedEvent {}

class AddAdvancedEvent extends AdvancedEvent {}

class UpdateAdvancedEvent extends AdvancedEvent {}

class DeleteAdvancedEvent extends AdvancedEvent {}
