import 'package:honey_comp/generated/l10n.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:honey_comp/core/widgets/custom_text_form_field.dart';
import 'package:honey_comp/features/checkout/domain/entities/orders_entity.dart';

class AddressPage extends StatelessWidget {
  const AddressPage(
      {super.key, required this.formKey, required this.valueListenable});

  final GlobalKey<FormState> formKey;
  final ValueListenable<AutovalidateMode> valueListenable;

  @override
  Widget build(BuildContext context) {
    var orderEntity = context.read<OrdersEntity>();
    return SingleChildScrollView(
      child: ValueListenableBuilder(
        valueListenable: valueListenable,
        builder: (context, value, child) => Form(
          key: formKey,
          autovalidateMode: value,
          child: Column(
            children: [
              const SizedBox(height: 24),
              CustomTextFormField(
                onSaved: (value) {
                  orderEntity.shippingAddressEntity!.fullName = value!;
                },
                hintText: S.of(context).fullNameHint,
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 12),
              CustomTextFormField(
                onSaved: (value) {
                  orderEntity.shippingAddressEntity!.email = value!;
                },
                hintText: S.of(context).emailHint,
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 12),
              CustomTextFormField(
                onSaved: (value) {
                  orderEntity.shippingAddressEntity!.address = value!;
                },
                hintText: S.of(context).address,
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 12),
              CustomTextFormField(
                onSaved: (value) {
                  orderEntity.shippingAddressEntity!.city = value!;
                },
                hintText: S.of(context).city,
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 12),
              CustomTextFormField(
                onSaved: (value) {
                  orderEntity.shippingAddressEntity!.addressDetails = value!;
                },
                hintText: S.of(context).floorApartmentNumber,
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 12),
              CustomTextFormField(
                onSaved: (value) {
                  orderEntity.shippingAddressEntity!.phone = value!;
                },
                hintText: S.of(context).phoneNumber,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}
