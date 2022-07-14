import 'package:training_app/domain/entities/entity.dart';

class Account {
  Account({
    this.id,
    this.email,
    this.avatarUrl,
    this.coverImageUrl,
    this.username,
    this.firstName,
    this.lastName,
    this.name,
    this.nickname,
    this.title,
    this.catchPharse,
    this.gender,
    this.phoneNumber,
    this.contactEmail,
    this.profileThemeColor,
    this.birthday,
    this.couponCode,
    this.subscription,
    this.primaryLanguage,
    this.secondaryLanguage,
    this.publishing,
  });

  final int? id;
  final String? email;
  final String? username;
  String? avatarUrl;
  String? coverImageUrl;
  // final BilingualObject? firstName;
  // final BilingualObject? lastName;
  // final BilingualObject? name;
  // final BilingualObject? nickname;
  // final BilingualObject? title;
  final Map<String, dynamic>? firstName;
  final Map<String, dynamic>? lastName;
  final Map<String, dynamic>? name;
  final Map<String, dynamic>? nickname;
  final Map<String, dynamic>? title;
  final Map<String, dynamic>? catchPharse;
  final String? gender;
  final String? phoneNumber;
  final String? contactEmail;
  final String? profileThemeColor;
  final String? birthday;
  final String? couponCode;
  final bool? subscription;
  final Language? primaryLanguage;
  final Language? secondaryLanguage;
  final bool? publishing;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'username': username,
      'avatar_url': avatarUrl,
      'cover_image_url': coverImageUrl,
      'first_name': firstName,
      'last_name': lastName,
      'name': name,
      'nickname': nickname,
      'title': title,
      'catchPharse': catchPharse,
      'gender': gender,
      'phone_number': phoneNumber,
      'contact_email': contactEmail,
      'profile_theme_color': profileThemeColor,
      'birthday': birthday,
      'coupon_code': couponCode,
      'subscription': subscription,
      'primary_language': primaryLanguage?.toJson(),
      'secondary_language': secondaryLanguage?.toJson(),
      'publishing': publishing,
    };
  }

  factory Account.fromJson(Map<String, dynamic> json) {
    return Account(
      id: json['id'],
      email: json['email'],
      username: json['username'],
      // firstName: json['first_name'] != null
      //     ? BilingualObject.fromJson(json['first_name'])
      //     : null,
      // lastName: json['last_name'] != null
      //     ? BilingualObject.fromJson(json['last_name'])
      //     : null,
      // name:
      //     json['name'] != null ? BilingualObject.fromJson(json['name']) : null,
      // nickname: json['nickname'] != null
      //     ? BilingualObject.fromJson(json['nickname'])
      //     : null,
      // title: json['title'] != null
      //     ? BilingualObject.fromJson(json['title'])
      //     : null,
      avatarUrl: json['avatar_url'],
      coverImageUrl: json['cover_image_url'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      name: json['name'],
      nickname: json['nickname'],
      title: json['title'],
      catchPharse: json['catchPharse'],
      gender: json['gender'],
      phoneNumber: json['phone_number'],
      contactEmail: json['contact_email'],
      profileThemeColor: json['profile_theme_color'],
      birthday: json['birthday'],
      couponCode: json['coupon_code'],
      subscription: json['subscription'],
      primaryLanguage: json['primary_language'] != null
          ? Language.fromJson(json['primary_language'])
          : null,
      secondaryLanguage: json['secondary_language'] != null
          ? Language.fromJson(json['secondary_language'])
          : null,
      publishing: json['publishing'],
    );
  }

  int? get getThemeColor =>
      int.tryParse('FF${profileThemeColor?.substring(1)}', radix: 16);

  Gender mapGender() {
    switch (gender) {
      case 'male':
        return Gender.male;
      case 'female':
        return Gender.female;
      default:
        return Gender.others;
    }
  }
}

enum Gender {
  male,
  female,
  others,
}

extension GenderExtension on Gender {
  String get getValue {
    switch (this) {
      case Gender.male:
        return '男性';
      case Gender.female:
        return '女性';
      default:
        return 'その他';
    }
  }
}

extension StringExtension on String {
  int? get colorValue => int.tryParse('FF${substring(1)}', radix: 16);
}
