import 'package:flutter/material.dart';
import 'package:honey_comp/generated/l10n.dart';

import 'custom_text_form_field.dart';

class PasswordField extends StatefulWidget {
  final void Function(String?)? onSaved;

  const PasswordField({super.key, this.onSaved});

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      obscureText: obscureText,
      hintText: S.of(context).password,
      onSaved: widget.onSaved,
      keyboardType: TextInputType.visiblePassword,
      suffixIcon: IconButton(
          onPressed: () {
            obscureText = !obscureText;
            setState(() {});
          },
          icon: obscureText ?const Icon(
            Icons.visibility_off,
            color: Color(0xffC9CECF),
          ): const Icon(
            Icons.visibility,
            color: Color(0xffC9CECF),
          )),
    );
  }
}
