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

  /// `continue with Spotify`
  String get loginButton {
    return Intl.message(
      'continue with Spotify',
      name: 'loginButton',
      desc: '',
      args: [],
    );
  }

  /// `submit`
  String get submitButton {
    return Intl.message(
      'submit',
      name: 'submitButton',
      desc: '',
      args: [],
    );
  }

  /// `cancel`
  String get cancelButton {
    return Intl.message(
      'cancel',
      name: 'cancelButton',
      desc: '',
      args: [],
    );
  }

  /// `delete`
  String get deleteButton {
    return Intl.message(
      'delete',
      name: 'deleteButton',
      desc: '',
      args: [],
    );
  }

  /// `oops! There are missing or incorrect fields`
  String get emptyFieldErr {
    return Intl.message(
      'oops! There are missing or incorrect fields',
      name: 'emptyFieldErr',
      desc: '',
      args: [],
    );
  }

  /// `This user already exists, is it you?`
  String get userAlreadyExistsErr {
    return Intl.message(
      'This user already exists, is it you?',
      name: 'userAlreadyExistsErr',
      desc: '',
      args: [],
    );
  }

  /// `we have created your account :)!! Welcome`
  String get userCreated {
    return Intl.message(
      'we have created your account :)!! Welcome',
      name: 'userCreated',
      desc: '',
      args: [],
    );
  }

  /// `account could not be created :( , please try again`
  String get userCouldNotBeCreated {
    return Intl.message(
      'account could not be created :( , please try again',
      name: 'userCouldNotBeCreated',
      desc: '',
      args: [],
    );
  }

  /// `an error occurred {err_code}, please report the error to us`
  String errnotnil(Object err_code) {
    return Intl.message(
      'an error occurred $err_code, please report the error to us',
      name: 'errnotnil',
      desc: '',
      args: [err_code],
    );
  }

  /// `username`
  String get usernameLabel {
    return Intl.message(
      'username',
      name: 'usernameLabel',
      desc: '',
      args: [],
    );
  }

  /// `name`
  String get nameLabel {
    return Intl.message(
      'name',
      name: 'nameLabel',
      desc: '',
      args: [],
    );
  }

  /// `i wanna hide my account`
  String get isAccountPublicLabel {
    return Intl.message(
      'i wanna hide my account',
      name: 'isAccountPublicLabel',
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
      Locale.fromSubtags(languageCode: 'tr'),
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
