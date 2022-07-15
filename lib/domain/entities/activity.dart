class Activity {
  final int? id;
  final String? title;
  final String? description;
  final bool? isRecent;
  final bool? isPublic;
  final List<ActivityMedia>? media;
  final String? departureDate;
  Activity({
    this.id,
    this.title,
    this.description,
    this.isRecent,
    this.isPublic,
    required this.media,
    this.departureDate,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'isRecent': isRecent,
      'isPublic': isPublic,
      'media': media?.map((x) => x.toJson()).toList(),
      'departureDate': departureDate,
    };
  }

  factory Activity.fromJson(Map<String, dynamic> map) {
    return Activity(
      id: map['id']?.toInt(),
      title: map['title'],
      description: map['description'],
      isRecent: map['is_recent'],
      isPublic: map['is_public'],
      media: map['media'] != null
          ? List<Map<String, dynamic>>.from(map['media']).map((e) => ActivityMedia.fromJson(e)).toList()
          : null,
      departureDate: map['departure_date'],
    );
  }
}

class ActivityMedia {
  ActivityMedia({
    this.id,
    this.url,
    this.thumbnail,
  });

  final int? id;
  final String? url;
  final String? thumbnail;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'url': url,
      'thumbnail': thumbnail,
    };
  }

  factory ActivityMedia.fromJson(Map<String, dynamic> map) {
    return ActivityMedia(
      id: map['id']?.toInt(),
      url: map['url'],
      thumbnail: map['thumbnail'],
    );
  }
}
