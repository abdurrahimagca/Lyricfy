// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
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
  String get localeName => 'en';

  static String m0(err_code) =>
      "an error occurred ${err_code}, please report the error to us";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "cancelButton": MessageLookupByLibrary.simpleMessage("cancel"),
        "deleteButton": MessageLookupByLibrary.simpleMessage("delete"),
        "emptyFieldErr": MessageLookupByLibrary.simpleMessage(
            "oops! There are missing or incorrect fields"),
        "errnotnil": m0,
        "isAccountPublicLabel":
            MessageLookupByLibrary.simpleMessage("i wanna hide my account"),
        "loginButton":
            MessageLookupByLibrary.simpleMessage("continue with Spotify"),
        "nameLabel": MessageLookupByLibrary.simpleMessage("name"),
        "submitButton": MessageLookupByLibrary.simpleMessage("submit"),
        "userAlreadyExistsErr": MessageLookupByLibrary.simpleMessage(
            "This user already exists, is it you?"),
        "userCouldNotBeCreated": MessageLookupByLibrary.simpleMessage(
            "account could not be created :( , please try again"),
        "userCreated": MessageLookupByLibrary.simpleMessage(
            "we have created your account :)!! Welcome"),
        "usernameLabel": MessageLookupByLibrary.simpleMessage("username")
      };
}
