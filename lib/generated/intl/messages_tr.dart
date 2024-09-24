// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a tr locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'tr';

  static String m0(err_code) =>
      "bir hata oluştu ${err_code} lutfen hatayı bize bildirin";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "cancelButton": MessageLookupByLibrary.simpleMessage("iptal"),
        "deleteButton": MessageLookupByLibrary.simpleMessage("sil"),
        "emptyFieldErr": MessageLookupByLibrary.simpleMessage(
            "eyvah! eksik veya hatalı alanlar var"),
        "errnotnil": m0,
        "isAccountPublicLabel":
            MessageLookupByLibrary.simpleMessage("hesabımı gizlemek istiyorum"),
        "loginButton":
            MessageLookupByLibrary.simpleMessage("Spotify ile devam et"),
        "nameLabel": MessageLookupByLibrary.simpleMessage("isim"),
        "submitButton": MessageLookupByLibrary.simpleMessage("gönder"),
        "userAlreadyExistsErr": MessageLookupByLibrary.simpleMessage(
            "bu kullanıcı zaten var, siz misiniz?"),
        "userCouldNotBeCreated": MessageLookupByLibrary.simpleMessage(
            "hesap oluşturulamadı :( , tekrar deneyin"),
        "userCreated": MessageLookupByLibrary.simpleMessage(
            "hesabını oluşturduk :)!! hoşgeldin"),
        "usernameLabel": MessageLookupByLibrary.simpleMessage("kullanıcı adı")
      };
}
