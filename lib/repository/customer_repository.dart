import 'package:injectable/injectable.dart';
import '../models/customer_model.dart';

@lazySingleton
class CustomerRepository {
  Customer fetchCustomer() {
    return Customer(name: 'Jane Doe', email: 'jane@example.com');
  }
}
