import 'package:flutter/material.dart';

import '../product.dart';

class AppTextFormField extends StatefulWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final AppTextFormFieldTypeEnum typeEnum;
  const AppTextFormField({
    super.key,
    this.controller,
    this.focusNode,
    required this.typeEnum,
  });

  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  @override
  void initState() {
    super.initState();
    if (widget.typeEnum == AppTextFormFieldTypeEnum.maturity) {
      widget.controller!.addListener(_handleCursorPosition);
    }
  }

  @override
  void dispose() {
    widget.controller!.removeListener(_handleCursorPosition);
    widget.controller!.dispose();
    super.dispose();
  }

  void _handleCursorPosition() {
    if (widget.controller == null) return;
    String text = widget.controller!.text;
    if (widget.controller!.selection.extentOffset > 1) {
      if (text.length > 2) {
        // Imleci en fazla 2. karakterin sonunda tut
        widget.controller!.value = widget.controller!.value.copyWith(
          selection: TextSelection.collapsed(offset: 2),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // Turkuaz rengini tanımlama
    const Color turquoiseColor = Colors.cyan; // Turkuaz rengi için bir örnek
    return SizedBox(
      height: 60,
      child: TextFormField(
        onTapOutside: (event) {
          FocusScope.of(context).unfocus();
        },
        onChanged: (value) {
          _onChanged(value);
        },
        inputFormatters: widget.typeEnum == AppTextFormFieldTypeEnum.maturity ? [CustomInputFormatter()] : null,
        controller: widget.controller,
        focusNode: widget.focusNode,
        cursorColor: turquoiseColor, // İmlecin rengini turkuaza ayarlama
        style: const TextStyle(
          fontWeight: FontWeight.bold, // Metin kalınlığını bold yapma
          fontSize: 20, // Metin boyutunu büyütme
        ),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12), // Yüksekliği etkileyen padding ayarı
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: Colors.grey, width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Colors.grey.shade400, width: 2), // Renk ve genişlik ayarı
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: turquoiseColor, width: 2),
          ),
        ),
      ),
    );
  }

  void _onChanged(String value) {
    if (widget.typeEnum == AppTextFormFieldTypeEnum.amount) {
      if (!value.contains('₺')) {
        Future.microtask(() => widget.controller?.text = '₺$value'); // '₺' simgesi yoksa, başına ekle
      }
    }
    //  else if (widget.typeEnum == AppTextFormFieldTypeEnum.maturity) {
    //   if (!value.contains('Ay')) {
    //     Future.microtask(() => widget.controller?.text = '$value Ay'); // 'Ay' ile bitmiyorsa, sonuna ' Ay' ekle
    //   }
    // }
  }
}

enum AppTextFormFieldTypeEnum {
  amount,
  maturity,
}
