import 'package:InLaw/src/features/auth/auth_module.dart';
import 'package:InLaw/src/features/onboarding/presentation/view/page/onboarding_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class OnBoardingModule extends Module {
  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, __) => const OnboardingPage()),
        ModuleRoute('/login', module: AuthModule()),
      ];
}