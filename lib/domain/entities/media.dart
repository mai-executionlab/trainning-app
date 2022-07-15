class Media {
  final int? id;
  final String? name;
  final int? mediumId;
  final String? mediumAttachmentUrl;
  final String? mediumAttachmentType;
  final String? timeline;
  Media({
    this.id,
    this.name,
    this.mediumId,
    this.mediumAttachmentUrl,
    this.mediumAttachmentType,
    this.timeline,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'medium_id': mediumId,
      'medium_attachment_url': mediumAttachmentUrl,
      'medium_attachment_type': mediumAttachmentType,
      'timeline': timeline,
    };
  }

  factory Media.fromAlbum(Map<String, dynamic> map) {
    return Media(
      id: map['id']?.toInt(),
      name: map['name'],
      mediumId: map['medium_id']?.toInt(),
      mediumAttachmentUrl: map['medium_attachment_url'],
      mediumAttachmentType: map['medium_attachment_type'],
      timeline: map['timeline'],
    );
  }

  factory Media.fromJson(Map<String, dynamic> map) {
    return Media(
      id: map['id']?.toInt(),
      mediumAttachmentUrl: map['attachment_url'],
      mediumAttachmentType: map['attachment_type'],
      timeline: map['timeline'],
    );
  }
}
