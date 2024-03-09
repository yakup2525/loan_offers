import 'package:dartz/dartz.dart';

import '/product/product.dart';
import '/features/features.dart';
import '/core/core.dart';

abstract class ILoanService {
  Future<Either<AppError, OfferResponseModel>> getLoanList(LoanModel loanModel);
}

class LoanService implements ILoanService {
  @override
  Future<Either<AppError, OfferResponseModel>> getLoanList(LoanModel loanModel) async {
    try {
      final response = await DioManager.instance.getRequest(EndPoints.getLoanOffers,
          queryParams: QueryParameters.createQueryParameters(loanModel: loanModel));

      final responseData = response.data;
      if (responseData.containsKey('error_message')) {
        // Hata yanıtı olduğunu varsayıyoruz ve AppError'a dönüştürüyoruz.
        final error = AppError.fromJson(responseData);
        return Left(error);
      } else {
        final Map<String, dynamic> responseDataa = response.data;
        responseDataa.forEach((key, value) {
          LogManager.debug(' $key, : $value');
        });
        final offerResponseModel = OfferResponseModel.fromJson(responseData);
        return Right(offerResponseModel);
      }
    } on AppError catch (error) {
      LogManager.error(error.message ?? '');
      return Left(error);
    } catch (e) {
      LogManager.error(e.toString());

      return Left(AppError(message: 'Bilinmeyen bir hata oluştu.'));
    }
  }
}
