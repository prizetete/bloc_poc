double calculateTax(double income, double taxRate) {
  if (income < 0 || taxRate < 0) {
    throw ArgumentError('Income และ TaxRate ต้องไม่ติดลบ');
  }
  return income * taxRate / 100;
}

abstract class TaxService {
  Future<double> getTaxRate();
}
