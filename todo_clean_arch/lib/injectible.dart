import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injectible.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
  generateForDir: ['lib'],
)
void configureDependencies() => getIt.init();
