import 'package:bloc_poc/models/customer_model.dart';
import 'package:bloc_poc/repository/customer_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class CustomerController {
  final CustomerRepository repository;

  CustomerController(this.repository);

  Customer loadCustomer() => repository.fetchCustomer();
}
