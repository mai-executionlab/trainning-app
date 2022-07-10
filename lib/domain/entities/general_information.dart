class GeneralInformation {
  GeneralInformation({
    this.catchPharse,
    this.travelOrganization,
    this.languageSkills,
    this.generalInfors,
    this.selfIntroduction,
  });

  final Map<String, dynamic>? catchPharse;
  final Map<String, List<dynamic>>? travelOrganization;
  final List<LanguageSkill>? languageSkills;
  final List<GeneralInfor>? generalInfors;
  final Map<String, dynamic>? selfIntroduction;

  Map<String, dynamic> toJson() {
    return {
      'catchpharse': catchPharse,
      'travel_organizations': travelOrganization,
      'language_skills': languageSkills?.map((x) => x.toJson()).toList(),
      'general_infos': generalInfors?.map((x) => x.toJson()).toList(),
      'self_introduction': selfIntroduction,
    };
  }

  factory GeneralInformation.fromJson(Map<String, dynamic> map) {
    return GeneralInformation(
      catchPharse: map['catchphrase'],
      travelOrganization: map['travel_organizations'] != null
          ? Map<String, List<dynamic>>.from(map['travel_organizations'])
          : null,
      languageSkills: map['language_skills'] != null
          ? List<Map<String, dynamic>>.from(map['language_skills'])
              .map((x) => LanguageSkill.fromJson(x))
              .toList()
          : null,
      generalInfors: map['general_infos'] != null
          ? List<Map<String, dynamic>>.from(map['general_infos'])
              .map((x) => GeneralInfor.fromJson(x))
              .toList()
          : null,
      selfIntroduction: map['self_introduction'],
    );
  }
}

class LanguageSkill {
  final int? id;
  final String? name;
  final String? level;
  LanguageSkill({
    this.id,
    this.name,
    this.level,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'level': level,
    };
  }

  factory LanguageSkill.fromJson(Map<String, dynamic> map) {
    return LanguageSkill(
      id: map['id']?.toInt(),
      name: map['name'],
      level: map['level'],
    );
  }
}

class GeneralInfor {
  final int? id;
  final String? inputType;
  final Map<String, dynamic>? value;
  final String? mediaUrl;
  GeneralInfor({
    this.id,
    this.inputType,
    this.value,
    this.mediaUrl,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'input_type': inputType,
      'value': value,
      'media_url': mediaUrl,
    };
  }

  factory GeneralInfor.fromJson(Map<String, dynamic> map) {
    return GeneralInfor(
      id: map['id']?.toInt(),
      inputType: map['input_type'],
      value: map['value'],
      mediaUrl: map['media_url'],
    );
  }
}
