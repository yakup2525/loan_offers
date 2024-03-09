import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loan_offers/features/features.dart';
import 'package:loan_offers/product/init/language/locale_keys.g.dart';
import '/product/product.dart';

final class LoanListScreen extends StatefulWidget {
  final LoanModel loanModel;

  const LoanListScreen({super.key, required this.loanModel});

  @override
  State<LoanListScreen> createState() => _LoanListScreenState();
}

class _LoanListScreenState extends State<LoanListScreen> {
  late LoanCubit _loanCubit;

  @override
  void initState() {
    super.initState();
    _loanCubit = BlocProvider.of<LoanCubit>(context);
    _loanCubit.getLoanList(widget.loanModel);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: LocaleKeys.loanList_title.tr(),
      ),
      body: Center(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('₺${widget.loanModel.amount}'),
                  const Text('|'),
                  Text('₺${widget.loanModel.maturity}'),
                ],
              ),
            ),
            Expanded(
              child: BlocBuilder<LoanCubit, AppState>(
                builder: (context, state) {
                  if (state is InitialState) {
                    return const SizedBox();
                  } else if (state is LoadingState) {
                    return const AppLoading();
                  } else if (state is SuccessState<OfferResponseModel>) {
                    final list = state.param?.activeOffers;
                    return _successBody(list);
                  } else if (state is ErrorState) {
                    return Center(child: Text(state.error.toString()));
                  } else {
                    return const SizedBox();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  ListView _successBody(List<OfferModel>? list) {
    return ListView.builder(
        itemCount: list?.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: SizedBox(
                width: 50,
                //  height: 50,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(list?[index].bank ?? ''),
                        TextButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return LoanDetailScreen(offerModel: list?[index], loanModel: widget.loanModel);
                                  });
                            },
                            child: const Text(LocaleKeys.loanList_offer_details).tr()),
                      ],
                    ),
                    Row(
                      children: [
                        _offerDetail(
                            LocaleKeys.loanList_offer_monthlyInstallment.tr(),
                            UtilsBll.calculateMonthlyPayment(
                                    amount: widget.loanModel.amount,
                                    annualRate: list?[index].annualRate ?? 0.0,
                                    maturity: widget.loanModel.maturity)
                                .toString()),
                        _offerDetail(
                          LocaleKeys.loanList_offer_interestRate.tr(),
                          (list?[index].interestRate ?? 0.0).toString(),
                        ),
                        _offerDetail(LocaleKeys.loanList_offer_totalAmount.tr(), widget.loanModel.amount.toString()),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text(LocaleKeys.loanList_offer_applyNow).tr(),
                    )
                  ],
                ),
                //  color: Colors.blue,
              ),
            ),
          );
        });
  }

  Column _offerDetail(String title, String detail) {
    return Column(
      children: [
        Text(title),
        Text(detail),
      ],
    );
  }
}
