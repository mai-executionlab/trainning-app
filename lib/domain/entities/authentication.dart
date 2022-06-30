

class Authentication {
  
  Authentication({
    this.accessToken,
    this.refreshToken,
    this.expireAt,
  });

  final String? accessToken;
  final String? refreshToken;
  final int? expireAt;
  

  Map<String, dynamic> toJson() {
    return {
      'access_token': accessToken,
      'refresh_token': refreshToken,
      'expire_at': expireAt,
    };
  }

  factory Authentication.fromJson(Map<String, dynamic> json) {
    return Authentication(
      accessToken: json['access_token'],
      refreshToken: json['refresh_token'],
      expireAt: json['expire_at']?.toInt(),
    );
  }

 }
