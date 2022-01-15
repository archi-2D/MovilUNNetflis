// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Continue`
  String get continue_label {
    return Intl.message(
      'Continue',
      name: 'continue_label',
      desc: '',
      args: [],
    );
  }

  /// `hello`
  String get hello {
    return Intl.message(
      'hello',
      name: 'hello',
      desc: '',
      args: [],
    );
  }

  /// `Invalid password`
  String get invalid_password {
    return Intl.message(
      'Invalid password',
      name: 'invalid_password',
      desc: '',
      args: [],
    );
  }

  /// `Create account`
  String get login_button_create_account {
    return Intl.message(
      'Create account',
      name: 'login_button_create_account',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login_button_login {
    return Intl.message(
      'Login',
      name: 'login_button_login',
      desc: '',
      args: [],
    );
  }

  /// `Login with google`
  String get login_button_login_google {
    return Intl.message(
      'Login with google',
      name: 'login_button_login_google',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get login_email_field_label {
    return Intl.message(
      'Email',
      name: 'login_email_field_label',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get login_password_field_label {
    return Intl.message(
      'Password',
      name: 'login_password_field_label',
      desc: '',
      args: [],
    );
  }

  /// `Phone number`
  String get login_phone_field_label {
    return Intl.message(
      'Phone number',
      name: 'login_phone_field_label',
      desc: '',
      args: [],
    );
  }

  /// `Log into your account`
  String get login_title {
    return Intl.message(
      'Log into your account',
      name: 'login_title',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Sign up free!`
  String get register_title {
    return Intl.message(
      'Sign up free!',
      name: 'register_title',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'es'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
