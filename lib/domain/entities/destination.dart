class Destinations {
  Destinations({
    this.id,
    this.name,
    this.description,
    this.area,
    this.imgUrl,
  });
  final int? id;
  final Map<String, dynamic>? name;
  final Map<String, dynamic>? description;
  final Area? area;
  final String? imgUrl;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'area': area?.toJson(),
      'image_url': imgUrl,
    };
  }

  factory Destinations.fromJson(Map<String, dynamic> map) {
    return Destinations(
      id: map['id']?.toInt(),
      name: map['name'],
      description: map['description'],
      area: map['area'] != null ? Area.fromJson(map['area']) : null,
      imgUrl: map['image_url'],
    );
  }
}

class Area {
  Area({
    this.id,
    this.name,
  });

  final int? id;
  final Map<String, dynamic>? name;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }

  factory Area.fromJson(Map<String, dynamic> map) {
    return Area(
      id: map['id']?.toInt(),
      name: map['name'],
    );
  }
}
