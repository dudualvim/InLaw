import 'package:InLaw/src/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:InLaw/src/common/form_text_field.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';
import '../../viewmodel/sign_up_viewmodel.dart';
import 'package:InLaw/src/theme.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends ModularState<SignUpPage, SignUpViewModel> {
  late ThemeData _theme;

  Widget get _pageName => Container(
    width: double.infinity,
    height: 60,
    child: Text(
      'Sign Up'.i18n(),
      style: kTitleBlack,
      textAlign: TextAlign.center,
    ),
  );

  Widget get _loadingIndicator => Visibility(
        child: const LinearProgressIndicator(
          backgroundColor: Colors.blueGrey,
        ),
        visible: store.isLoading,
  );

  Widget get _name => widget.createFormField(
        title: 'name'.i18n(),
        theme: _theme,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.next,
        hint: 'name_hint'.i18n(),
        enabled: !store.isLoading,
        errorText: store.error.name,
        //errorText: store.error.name,
        onChange: (value) => store.name = value,
  );

  Widget get _email => widget.createFormField(
        title: 'email'.i18n(),
        theme: _theme,
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.next,
        hint: 'email_hint'.i18n(),
        enabled: !store.isLoading,
        errorText: store.error.email,
        onChange: (value) => store.email = value,
  );

  Widget get _password => widget.createFormField(
        title: 'password'.i18n(),
        theme: _theme,
        keyboardType: TextInputType.text,
        obscureText: true,
        hint: 'password_hint'.i18n(),
        enabled: !store.isLoading,
        errorText: store.error.password,
        onChange: (value) => store.password = value,
  );

  Widget get _signUpButton => Container(
        margin: const EdgeInsets.fromLTRB(30, 15, 30, 5),
        width: double.infinity,
        height: 56,
        child: ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
            ),
          ),
          //onPressed: store.isLoading ? null : () {store.login, pop},
          //Navigator.pop(context);
          onPressed: store.isLoading ? null : store.signUp,
          child: Text('signup'.i18n()),
        ),
      );

  Widget get _backToLoginButton => Container(
          margin: const EdgeInsets.fromLTRB(30, 30, 30, 20),
          width: double.infinity,
          height: 56,
          child: TextButton(
            style: TextButton.styleFrom(splashFactory: NoSplash.splashFactory),
            onPressed: store.isLoading ? null : () {
              Navigator.pop(
                context,
              );
            },
            child: Text('already_have_an_account'.i18n()),
          ),
        );

  Widget get _formBuild => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const SizedBox(height: 5),
                  _pageName,
                  _name,
                  _email,
                  _password,
                  _signUpButton,
                  _backToLoginButton,
                  _loadingIndicator,
                ],
              );

  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: getTheme(),
      home: Scaffold(
        appBar: AppBar(centerTitle: true, title: const Text('InLaw')),
        backgroundColor: AppColors.primary,
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height*0.88,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                )
              ),
            child: Observer(builder: (_) {
              return Form(child: _formBuild);
            }),
            )
          ),
        ),
      ),
    );
  }
}