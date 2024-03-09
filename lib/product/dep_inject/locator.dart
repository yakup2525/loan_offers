import 'package:get_it/get_it.dart';

import '/features/features.dart';

/// Global instance for reaching get it
final GetIt getIt = GetIt.instance;

/// initialize get it
Future<void> initLocator() async {
  // * Singleton
  getIt.registerSingletonAsync<ILoanService>(() async => LoanService());

  await getIt.allReady();
}
