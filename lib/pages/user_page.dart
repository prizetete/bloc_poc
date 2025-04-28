import 'package:bloc_poc/bloc/user/user_bloc.dart';
import 'package:bloc_poc/locator.dart';
import 'package:bloc_poc/repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Dependency Injection Usecase

class UserPage extends StatelessWidget {
  UserPage({super.key});
  final UserRepository repository = UserRepository();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // create: (_) => UserBloc(repository)..add(FetchUser()),
      create:
          (_) =>
              UserBloc(getIt<UserRepository>())
                ..add(FetchUser()), // This line call getIt<UserRepository>()
      child: Scaffold(
        appBar: AppBar(title: Text('User Info')),
        body: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is UserLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is UserLoaded) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Name: ${state.user.name}'),
                    Text('Email: ${state.user.email}'),
                  ],
                ),
              );
            } else if (state is UserError) {
              return Center(child: Text('Error: ${state.message}'));
            }
            return Center(child: Text('Press to fetch user'));
          },
        ),
      ),
    );
  }
}
