import 'package:bloc_poc/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaiCubit extends Cubit<PaiState> {
  PaiCubit() : super(PaiInitialState(customerData: [], totalSalary: 0));

  List<CustomerData> members = [];

  addMember() async {
    emit(PaiLoadingState(customerData: [], totalSalary: 0));

    await Future.delayed(const Duration(seconds: 1));

    members.add(
      CustomerData(
        id: members.length + 1,
        name: 'Member code.${randomString(5)}',
        salary: (members.length + 1) * 1000,
      ),
    );

    emit(PaiHasDataState(customerData: members, totalSalary: 1000));
  }

  clearAll() {
    members.clear();
    emit(PaiHasDataState(customerData: members, totalSalary: 1000));
  }
}

class CustomerData {
  final int id;
  final String name;
  final int salary;

  const CustomerData({
    required this.id,
    required this.name,
    required this.salary,
  });
}

abstract class PaiState {
  final List<CustomerData> customerData;
  final int totalSalary;

  const PaiState({required this.customerData, required this.totalSalary});
}

class PaiInitialState extends PaiState {
  const PaiInitialState({
    required super.customerData,
    required super.totalSalary,
  });
}

class PaiLoadingState extends PaiState {
  const PaiLoadingState({
    required super.customerData,
    required super.totalSalary,
  });
}

class PaiHasDataState extends PaiState {
  const PaiHasDataState({
    required super.customerData,
    required super.totalSalary,
  });
}
