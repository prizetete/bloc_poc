part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchUser extends UserEvent {
  // final String userId;

  // FetchUser(this.userId);

  // @override
  // List<Object?> get props => [userId];
}
