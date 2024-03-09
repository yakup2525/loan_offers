import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:loan_offers/product/init/language/locale_keys.g.dart';

import '../../../product/product.dart';
import '/features/features.dart';

final class LoanDetailScreen extends StatefulWidget {
  final OfferModel? offerModel;
  final LoanModel loanModel;

  const LoanDetailScreen({
    super.key,
    required this.offerModel,
    required this.loanModel,
  });

  @override
  State<LoanDetailScreen> createState() => _LoanDetailScreenState();
}

class _LoanDetailScreenState extends State<LoanDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
      child: Center(
        child: Material(
          child: Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.height * 0.75,
              width: MediaQuery.of(context).size.width - 24,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(widget.offerModel?.bank ?? ''),
                          IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: const Icon(Icons.close),
                          ),
                        ],
                      ),
                      Text('${LocaleKeys.loanList_offer_loanType.tr()}: ${widget.offerModel?.productName}'),
                      Text('${LocaleKeys.loanList_offer_loanAmount.tr()} :${widget.loanModel.amount}'),
                      Text('${LocaleKeys.loanList_offer_maturity.tr()} :${widget.loanModel.maturity}'),
                      Text('${LocaleKeys.loanList_offer_monthlyInstallment.tr()} : ${UtilsBll.calculateMonthlyPayment(
                        amount: widget.loanModel.amount,
                        annualRate: widget.offerModel?.annualRate ?? 0.0,
                        maturity: widget.loanModel.maturity,
                      )}'),
                      Text('${LocaleKeys.loanList_offer_interestRate.tr()} :${widget.offerModel?.interestRate}'),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Row(
                      children: [const Icon(Icons.save_as), const Text(LocaleKeys.loanList_offer_applyNow).tr()],
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
