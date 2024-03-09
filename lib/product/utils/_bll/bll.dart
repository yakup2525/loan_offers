import 'dart:math';

class UtilsBll {
  static double calculateMonthlyPayment({
    required double annualRate,
    required int amount,
    required int maturity,
  }) {
    double totalInterestRate = annualRate * 0.013;
    double monthlyPayment = 0;

    if (totalInterestRate > 0) {
      monthlyPayment = (amount * totalInterestRate * pow((1 + totalInterestRate), maturity)) /
          (pow((1 + totalInterestRate), maturity) - 1);
    }

    return monthlyPayment;
  }
}
