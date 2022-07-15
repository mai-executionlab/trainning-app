class Skill {
  Skill({
    this.domesticBManager,
    this.generalBManager,
    this.toeic,
    this.tourismEnglish,
    this.worldHeritage,
    this.travelGeography,
    this.otherDegrees,
  });

  final bool? domesticBManager;
  final bool? generalBManager;
  final int? toeic;
  final bool? tourismEnglish;
  final bool? worldHeritage;
  final String? travelGeography;
  final Map<String, List?>? otherDegrees;

  Map<String, dynamic> toJson() {
    return {
      'domestic_business_manager': domesticBManager == true ? 'yes' : 'no',
      'general_business_manager': generalBManager == true ? 'yes' : 'no',
      'toeic': toeic,
      'tourism_english': tourismEnglish == true ? 'yes' : 'no',
      'world_heritage': worldHeritage == true ? 'yes' : 'no',
      'travel_geography': travelGeography,
      'orther_degrees': otherDegrees,
    };
  }

  factory Skill.fromJson(Map<String, dynamic> map) {
    return Skill(
      domesticBManager:
          map['domestic_business_manager'] == 'yes' ? true : false,
      generalBManager: map['general_business_manager'] == 'yes' ? true : false,
      toeic: map['toeic'] != null ? int.tryParse(map['toeic']) : null,
      tourismEnglish: map['tourism_english'] == 'yes' ? true : false,
      worldHeritage: map['world_heritage'] == 'yes' ? true : false,
      travelGeography: map['travel_geography'],
      otherDegrees: map['orther_degrees'] != null
          ? Map<String, List?>.from(map['orther_degrees'])
          : null,
    );
  }
}
