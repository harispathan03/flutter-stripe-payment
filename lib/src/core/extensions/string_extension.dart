// this extension are used with String for validation of email, password, words etc.

// import '../language/app_localizations.dart';

extension StringExtension on String {
  // checking word is valid email
  bool get isValidEmail {
    final emailRegExp = RegExp(
        r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    return isNotEmpty && !isContainEmoji && emailRegExp.hasMatch(this);
  }

  // checking word is valid email End

  // checking word is valid word
  bool get isValidWord {
    final wordRegExp = RegExp(r'[A-Za-z]+$');
    return wordRegExp.hasMatch(this);
  }

  // checking word is valid word End

  // checking word contains emoji
  bool get isContainEmoji {
    final emojiRegExp = RegExp(
        r'([\u20a0-\u32ff\ud83c\udc00-\ud83d\udeff\udbb9\udce5-\udbb9\udcee])',
        unicode: true);
    return contains(emojiRegExp);
  }

  // checking word contains emoji End

  // checking word is valid word
  bool get isValidPassword {
    final passwordRegExp = RegExp(
        r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{8,}');
    return passwordRegExp.hasMatch(this);
  }

  // checking word is valid word End
  bool get isValidUserName {
    final userNameRegExp = RegExp(r"[A-Za-z][A-Za-z0-9]{7,30}$");
    return userNameRegExp.hasMatch(this);
  }

  // translate this key to appropriate text based on language selected
  // String tr(BuildContext context) {
  //   //todo: find way to handle null if AppLocalization is not initialized
  //   return AppLocalizations.of(context)?.translate(this) ?? "not found string";
  // }

// checking given url is valid or not
  bool get isValidUrl {
    final urlRegEx =
        RegExp(r'(?:(?:https?|ftp):\/\/)?[\w/\-?=%.]+\.[\w/\-?=%.]+');
    return urlRegEx.hasMatch(this);
  }
}
