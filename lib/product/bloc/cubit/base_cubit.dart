import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loan_offers/product/bloc/bloc.dart';

base class BaseCubit<T> extends Cubit<AppState> {
  BaseCubit(super.initialState);

  void safeEmit(T state) {
    if (isClosed) return;
    emit(state as AppState);
  }
}
