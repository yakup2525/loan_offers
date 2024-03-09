class LoanModel {
  int? loanType;
  int maturity;
  int amount;
  LoanModel({
    this.loanType = 0,
    required this.maturity,
    required this.amount,
  });
}
