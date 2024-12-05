import 'package:flutter/material.dart';

class DefaultTextFromField extends StatefulWidget {
  TextEditingController controller;
  String hintext;
  String? Function(String?)? validator;
  bool isPassword;
  DefaultTextFromField({
    required this.controller,
    required this.hintext,
    this.validator,
    this.isPassword = false,
  });

  @override
  State<DefaultTextFromField> createState() => _DefaultTextFromFieldState();
}

class _DefaultTextFromFieldState extends State<DefaultTextFromField> {
  late bool isObscure = widget.isPassword;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
          hintText: widget.hintext,
          hintStyle: Theme.of(context).textTheme.titleSmall,
          suffixIcon: widget.isPassword
              ? IconButton(
                  onPressed: () {
                    isObscure = !isObscure;
                    setState(() {});
                  },
                  icon: Icon(isObscure
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined),
                )
              : null),
      validator: widget.validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: isObscure,
    );
  }
}
