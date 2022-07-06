class Language {
  Language({
    this.code,
    this.name,
    this.nameJa,
  });

  final String? code;
  final String? name;
  final String? nameJa;

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'name': name,
      'name_ja': nameJa,
    };
  }

  factory Language.fromJson(Map<String, dynamic> json) {
    return Language(
      code: json['code'],
      name: json['name'],
      nameJa: json['name_ja'],
    );
  }
}
