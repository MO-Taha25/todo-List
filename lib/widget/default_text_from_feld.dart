import 'package:flutter/material.dart';

class DefaultTextFromField extends StatelessWidget {
  TextEditingController controller;
  String hintext;
  String? Function(String?)? validator;
  DefaultTextFromField(
      {required this.controller, required this.hintext, this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          hintText: hintext, hintStyle: Theme.of(context).textTheme.titleSmall),
      validator: validator,
    );
  }
}
