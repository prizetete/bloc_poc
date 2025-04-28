import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int id;
  final String name;
  final String email;

  const User({required this.id, required this.name, required this.email});

  factory User.fromJson(Map<String, dynamic> json) =>
      User(id: json['id'], name: json['name'], email: json['email']);

  @override
  List<Object> get props => [id, name, email];
}
