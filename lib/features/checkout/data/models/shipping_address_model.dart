import 'package:honey_comp/features/checkout/domain/entities/shipping_Address_entity.dart';

class ShippingAddressModel {
  String? fullName;
  String? email;
  String? address;
  String? city;
  String? addressDetails;
  String? phone;

  ShippingAddressModel({
    this.fullName,
    this.email,
    this.address,
    this.city,
    this.addressDetails,
    this.phone,
  });

  factory ShippingAddressModel.fromJson(Map<String, dynamic> json) {
    return ShippingAddressModel(
      fullName: json['fullName'],
      email: json['email'],
      address: json['address'],
      city: json['city'],
      addressDetails: json['addressDetails'],
      phone: json['phone'],
    );
  }

  factory ShippingAddressModel.fromEntity(ShippingAddressEntity entity) {
    return ShippingAddressModel(
      fullName: entity.fullName,
      email: entity.email,
      address: entity.address,
      city: entity.city,
      addressDetails: entity.addressDetails,
      phone: entity.phone,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'fullName': fullName,
      'email': email,
      'address': address,
      'city': city,
      'addressDetails': addressDetails,
      'phone': phone,
    };
  }

  ShippingAddressEntity toEntity() {
    return ShippingAddressEntity(
      fullName: fullName,
      email: email,
      address: address,
      city: city,
      addressDetails: addressDetails,
      phone: phone,
    );
  }
}
