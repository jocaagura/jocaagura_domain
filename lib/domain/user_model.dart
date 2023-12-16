part of '../jocaagura_domain.dart';

enum UserEnum {
  id,
  displayName,
  photoUrl,
  email,
  jwt,
}

const UserModel defaultUserModel = UserModel(
  id: '',
  displayName: 'J.J.',
  photoUrl: '',
  email: 'anonimo@anonimo.com.co',
  jwt: <String, dynamic>{},
);

class UserModel extends Model {
  const UserModel({
    required this.id,
    required this.displayName,
    required this.photoUrl,
    required this.email,
    required this.jwt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json[UserEnum.id.name]?.toString() ?? defaultUserModel.id,
      displayName: json[UserEnum.displayName.name]?.toString() ??
          defaultUserModel.displayName,
      photoUrl: Utils.getUrlFromDynamic(json[UserEnum.photoUrl.name]),
      email: Utils.getEmailFromDynamic(json[UserEnum.email.name]),
      jwt: Utils.mapFromDynamic(json[UserEnum.jwt.name]),
    );
  }

  final String id;
  final String displayName;
  final String photoUrl;
  final String email;
  final Map<String, dynamic> jwt;

  @override
  UserModel copyWith({
    String? id,
    String? names,
    String? photoUrl,
    String? lastNames,
    Map<String, dynamic>? jwt,
  }) =>
      UserModel(
        id: id ?? this.id,
        displayName: names ?? this.displayName,
        photoUrl: photoUrl ?? this.photoUrl,
        email: lastNames ?? this.email,
        jwt: jwt ?? this.jwt,
      );

  @override
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      UserEnum.id.name: id,
      UserEnum.displayName.name: displayName,
      UserEnum.photoUrl.name: photoUrl,
      UserEnum.email.name: email,
      UserEnum.jwt.name: Utils.mapToString(jwt),
    };
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          displayName == other.displayName &&
          photoUrl == other.photoUrl &&
          jwt == other.jwt &&
          email == other.email &&
          hashCode == other.hashCode;

  @override
  int get hashCode => '$id$displayName$photoUrl$email$jwt'.hashCode;

  @override
  String toString() {
    return 'UserModel: ${toJson()}';
  }
}
