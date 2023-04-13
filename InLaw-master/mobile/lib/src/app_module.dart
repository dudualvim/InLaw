import 'package:InLaw/src/features/onboarding/onboarding_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'features/auth/auth_module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/', module: OnBoardingModule()),
        ModuleRoute('/login/', module: AuthModule())
      ];
}
