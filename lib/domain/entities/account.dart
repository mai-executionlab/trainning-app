import 'package:training_app/domain/entities/entity.dart';

class Account {
  Account({
    this.email,
    this.firstName,
    this.lastName,
    this.birthday,
    this.couponCode,
    this.subscription,
    this.primaryLanguage,
    this.secondaryLanguage,
  });

  final String? email;
  final BilingualObject? firstName;
  final BilingualObject? lastName;
  final String? birthday;
  final String? couponCode;
  final bool? subscription;
  final Language? primaryLanguage;
  final Language? secondaryLanguage;

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'first_name': firstName?.toJson(),
      'last_name': lastName?.toJson(),
      'birthday': birthday,
      'coupon_code': couponCode,
      'subscription': subscription,
      'primary_language': primaryLanguage?.toJson(),
      'secondary_language': secondaryLanguage?.toJson(),
    };
  }

  factory Account.fromJson(Map<String, dynamic> json) {
    return Account(
      email: json['email'],
      firstName: json['first_name'] != null
          ? BilingualObject.fromJson(json['first_name'])
          : null,
      lastName: json['last_name'] != null
          ? BilingualObject.fromJson(json['last_name'])
          : null,
      birthday: json['birthday'],
      couponCode: json['coupon_code'],
      subscription: json['subscription'],
      primaryLanguage: json['primary_language'] != null
          ? Language.fromJson(json['primary_language'])
          : null,
      secondaryLanguage: json['secondary_language'] != null
          ? Language.fromJson(json['secondary_language'])
          : null,
    );
  }
}
