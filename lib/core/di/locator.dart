import "package:get_it/get_it.dart";
import "package:injectable/injectable.dart";

import "locator.config.dart";

final GetIt sl = GetIt.instance;

@InjectableInit()
void configureDependencies() => sl.init();
