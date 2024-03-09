import '/features/features.dart';

class QueryParameters {
  static Map<String, dynamic> createQueryParameters({
    required LoanModel loanModel,
  }) {
    return {
      'kredi_tipi': loanModel.loanType.toString(),
      'vade': loanModel.maturity.toString(),
      'tutar': loanModel.amount.toString(),
    };
  }
}
