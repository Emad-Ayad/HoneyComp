import 'package:flutter/material.dart';
import 'package:honey_comp/core/widgets/custom_text_form_field.dart';

class AddressPage extends StatelessWidget {
  const AddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 24),
          CustomTextFormField(
            hintText: "الاسم كامل",
            keyboardType: TextInputType.text,
          ),
          SizedBox(height: 12),
          CustomTextFormField(
            hintText: "البريد الإلكتروني",
            keyboardType: TextInputType.text,
          ),
          SizedBox(height: 12),
          CustomTextFormField(
            hintText: "العنوان",
            keyboardType: TextInputType.text,
          ),
          SizedBox(height: 12),
          CustomTextFormField(
            hintText: "المدينه",
            keyboardType: TextInputType.text,
          ),
          SizedBox(height: 12),
          CustomTextFormField(
            hintText: "رقم الطابق , رقم الشقه ..",
            keyboardType: TextInputType.text,
          ),
          SizedBox(height: 12),
          CustomTextFormField(
            hintText: "رقم الهاتف",
            keyboardType: TextInputType.number,
          ),
          SizedBox(height: 12),
        ],
      ),
    );
  }
}
