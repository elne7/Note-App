import 'package:flutter/material.dart';
import 'package:note_app/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key, required this.hint, this.maxLine = 1, this.onSaved, this.onChanged});

  final String hint;
  final int maxLine;
  final void Function(String?)? onSaved;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      onSaved: onSaved,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'This field is required';
        } else {
          return null;
        }
      },
      cursorColor: kPrimaryColor,
      maxLines: maxLine,
      decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: kPrimaryColor),
          border: buildBorder(),
          enabledBorder: buildBorder(),
          focusedBorder: buildBorder(kPrimaryColor)),
    );
  }

  OutlineInputBorder buildBorder([color]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: color ?? Colors.white,
      ),
    );
  }
}
