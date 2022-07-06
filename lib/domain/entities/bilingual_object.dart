class BilingualObject {
  BilingualObject({
    this.ja,
    this.en,
  });

  final String? ja;
  final String? en;

  Map<String, dynamic> toJson() {
    return {
      'ja': ja,
      'en': en,
    };
  }

  factory BilingualObject.fromJson(Map<String, dynamic> json) {
    return BilingualObject(
      ja: json['ja'],
      en: json['en'],
    );
  }
}
