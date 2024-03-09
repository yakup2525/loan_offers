import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loan_offers/features/features.dart';
import 'core/core.dart';
import 'product/product.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await EnvManager.instance.init();
  initLocator();

  runApp(const MyApp());
}

final class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProductLocalization(
      child: const BlocInitialize(
        child: _MyApp(),
      ),
    );
  }
}

final class _MyApp extends StatelessWidget {
  const _MyApp();

  @override
  Widget build(BuildContext context) {
    return _themeBuilder();
  }

  BlocBuilder<ThemeBloc, ThemeState> _themeBuilder() {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, themeState) {
        SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent, // Status bar rengini transparent yapar
          statusBarIconBrightness: Brightness.dark, // Status bar icon rengini ayarlar
        ));
        return _metaApp(context, themeState);
      },
    );
  }

  MaterialApp _metaApp(BuildContext context, ThemeState themeState) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: themeState.themeData,
      home: const SearchLoanScreen(),
    );
  }
}
