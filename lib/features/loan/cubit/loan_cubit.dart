import 'package:loan_offers/features/features.dart';
import '/product/product.dart';

final class LoanCubit extends BaseCubit<AppState> {
  LoanCubit() : super(const InitialState());

  Future<void> getLoanList(LoanModel loanModel) async {
    safeEmit(const LoadingState());
    final either = await getIt<ILoanService>().getLoanList(loanModel);
    either.fold(
      (appError) {
        safeEmit(ErrorState(appError));
      },
      (offerResponseModel) {
        safeEmit(SuccessState<OfferResponseModel>(param: offerResponseModel));
      },
    );
  }
}
