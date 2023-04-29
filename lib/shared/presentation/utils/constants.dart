import 'package:intl/intl.dart';

/// Defines the constants for the presentation layer
class Constants {
  Constants._();

  static const supportedLanguages = ['en'];

  static final currencyFormat = NumberFormat.currency(name: '', decimalDigits: 0);

  static final emailRegex = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  static final phoneRegex = RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)');
  static final nameRegex = RegExp(
      r"^[a-zA-ZàáâäãåąčćęèéêëėįìíîïłńòóôöõøùúûüųūÿýżźñçčšžÀÁÂÄÃÅĄĆČĖĘÈÉÊËÌÍÎÏĮŁŃÒÓÔÖÕØÙÚÛÜŲŪŸÝŻŹÑßÇŒÆČŠŽ∂ð ,.'-]+$");
  static final numberRegex = RegExp(r'^-?(([0-9]*)|(([0-9]*)\.([0-9]*)))$');
}
