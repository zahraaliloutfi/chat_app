import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  String? hintText;
  Function(String)? onChanged;
  CustomTextFormField({super.key, 
    this.onChanged,
    this.hintText,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // keyboardType: TextInputType.emailAddress,
      validator: (data) {
        if (data!.isEmpty) {
          return 'field if empty ';
        }
        return null;
        // else if (!EmailValidator.validate(data)) {
        //   return 'invalid';
        // }
      },
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.grey,
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
