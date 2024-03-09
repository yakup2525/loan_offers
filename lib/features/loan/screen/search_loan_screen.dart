import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loan_offers/features/features.dart';
import 'package:loan_offers/product/init/language/locale_keys.g.dart';
import '/product/product.dart';

final class SearchLoanScreen extends StatefulWidget {
  const SearchLoanScreen({super.key});

  @override
  State<SearchLoanScreen> createState() => _SearchLoanScreenState();
}

class _SearchLoanScreenState extends State<SearchLoanScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
        isLeading: false,
        title: LocaleKeys.searchLoan_title.tr(),
      ),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ChangeThemeSwitcher(),
          SizedBox(height: 500, child: LoanOfferForm()),
        ],
      ),
    );
  }
}

class LoanOfferForm extends StatefulWidget {
  const LoanOfferForm({super.key});

  @override
  State<LoanOfferForm> createState() => _LoanOfferFormState();
}

class _LoanOfferFormState extends State<LoanOfferForm> {
  double _amount = 30000;
  int _duration = 36;
  late TextEditingController _amountController;
  late FocusNode _amountFocusNode;

  late TextEditingController _maturityController;
  late FocusNode _maturityFocusNode;
  @override
  void initState() {
    _amountController = TextEditingController(text: '₺${_amount.round()}');
    _amountFocusNode = FocusNode();
    _maturityController = TextEditingController(text: '$_duration Ay');
    _maturityFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _amountController.dispose();
    _amountFocusNode.dispose();

    _maturityController.dispose();
    _maturityFocusNode.dispose();

    super.dispose();
  }

  int _removeNonDigits(String input) {
    // RegExp kullanarak, rakam olmayan tüm karakterleri çıkar
    return int.parse(input.replaceAll(RegExp(r'[^0-9]'), ''));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _amountTextForm(),
        _slider(_amount, 0, 300000, (value) {
          setState(() {
            _amountController.text = '₺${_amount.round()}';
            _amount = value;
          });
        }),
        _maturityTextForm(),
        _slider(_duration.toDouble(), 6, 60, (value) {
          setState(() {
            _duration = value.toInt();
            _maturityController.text = '${_duration.round()} ${LocaleKeys.searchLoan_month.tr()}';
          });
        }),
        _getLoanOfferButton(context),
      ],
    );
  }

// #region private widgets

  Padding _amountTextForm() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 16, right: 16),
      child: AppTextFormField(
        controller: _amountController,
        focusNode: _amountFocusNode,
        typeEnum: AppTextFormFieldTypeEnum.amount,
      ),
    );
  }

  Padding _maturityTextForm() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
      child: AppTextFormField(
        controller: _maturityController,
        focusNode: _maturityFocusNode,
        typeEnum: AppTextFormFieldTypeEnum.maturity,
      ),
    );
  }

  SliderTheme _slider(double value, double min, double max, void Function(double)? onChanged) {
    return SliderTheme(
      data: SliderThemeData(
        trackShape: const RectangularSliderTrackShape(),
        trackHeight: 4.0,
        thumbColor: Colors.teal,
        thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 12.0),
        activeTrackColor: Colors.tealAccent[700],
        inactiveTrackColor: Colors.tealAccent[100],
        overlayColor: Colors.teal.withAlpha(32),
        overlayShape: const RoundSliderOverlayShape(overlayRadius: 28.0),
      ),
      child: Slider(
        min: min,
        max: max,
        divisions: 1000,
        //label: '₺${_amount.round()}',
        value: value,
        onChanged: onChanged,
      ),
    );
  }

  ElevatedButton _getLoanOfferButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.teal, // Background color
        foregroundColor: Colors.white, // Text Color (Foreground color)
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => BlocProvider(
                    create: (BuildContext context) => LoanCubit(),
                    child: LoanListScreen(
                      loanModel: LoanModel(
                        amount: _removeNonDigits(_amountController.text),
                        maturity: _removeNonDigits(_maturityController.text),
                      ),
                    ),
                  )),
        );
      },
      child: const Text(
        LocaleKeys.searchLoan_loanOffers,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ).tr(),
    );
  }
// #endregion
}
