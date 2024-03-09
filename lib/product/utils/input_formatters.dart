import 'package:flutter/services.dart';

/// İlk iki karakter doluysa ve rakamsa, daha fazla yazılamasını engelle
final class CustomInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.length > 2 && RegExp(r'^\d{2}$').hasMatch(newValue.text.substring(0, 2))) {
      return oldValue;
    }
    return newValue;
  }
}
