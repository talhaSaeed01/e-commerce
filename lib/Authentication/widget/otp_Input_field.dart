// ignore_for_file: file_names, library_private_types_in_public_api, prefer_final_fields

import 'package:flutter/material.dart';

class OtpInputField extends StatefulWidget {
  const OtpInputField({super.key});

  @override
  _OtpInputFieldState createState() => _OtpInputFieldState();
}

class _OtpInputFieldState extends State<OtpInputField> {
  List<String> _otpValues = List.generate(4, (index) => '');

  void _onTextChanged(int index, String value) {
    if (value.isNotEmpty) {
      if (index < 3) {
        FocusScope.of(context).nextFocus();
      }
      setState(() {
        _otpValues[index] = value;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
            4,
            (index) => Container(
                width: 50.0,
                height: 50.0,
                margin: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Colors.black)),
                child: TextField(
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    onChanged: (value) => _onTextChanged(index, value),
                    decoration: const InputDecoration(counterText: '', border: InputBorder.none)))));
  }
}
