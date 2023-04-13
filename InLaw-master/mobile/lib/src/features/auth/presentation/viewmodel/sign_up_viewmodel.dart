import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../domain/usecase/sign_up_usecase.dart';

part 'sign_up_viewmodel.g.dart';

class SignUpViewModel = _SignUpViewModelBase with _$SignUpViewModel;

abstract class _SignUpViewModelBase with Store {
  final error = SignUpError();
  final _usecase = Modular.get<SignUpUseCase>();

  @observable
  String name = '';

  @observable
  String email = '';

  @observable
  String password = '';

  @observable
  bool isLoading = false;

  @action
  void validateName() {
    error.name = _usecase.validateName(name);
  }

  @action
  void validateEmail() {
    error.email = _usecase.validateEmail(email);
  }

  @action
  void validatePassword() {
    error.password = _usecase.validatePassword(password);
  }

  void signUp() async {
    error.clear();

    validateName();
    validateEmail();
    validatePassword();

    if (!error.hasErrors) {
      isLoading = true;
      try {
        await _usecase.signUp(name, email, password);
        //page to 
      } on UnimplementedError {
        // TODO: Fix!!!
        error.signUp = 'Função não implementada!';
      } finally {
        isLoading = false;
      }
    }
  }
}

class SignUpError = _SignUpErrorBase with _$SignUpError;

abstract class _SignUpErrorBase with Store {

  @observable
  String? name;

  @observable
  String? email;

  @observable
  String? password;

  @observable
  String? signUp;

  @computed
  bool get hasErrors => name != null || email != null || password != null || signUp != null;

  void clear() {
    name = null;
    email = null;
    password = null;
    signUp = null;
  }
}
