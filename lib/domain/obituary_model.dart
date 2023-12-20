part of '../jocaagura_domain.dart';

enum ObituaryEnum {
  id,
  photoUrl,
  person,
  creationDate,
  vigilAddress,
  burialAddress,
  message,
}

final ObituaryModel defaultObituary = ObituaryModel(
    id: 'qwerty',
    person: defaultPersonModel,
    creationDate: DateTime(2023, 12, 18),
    vigilAddress: defaultAddressModel,
    burialAddress: defaultAddressModel,
    message:
        "Lamentamos profundamente tu perdida. Esperamos que tu memoria perdure como una fuente de inspiración y amor.");

@immutable
class ObituaryModel extends Model {
  const ObituaryModel({
    required this.id,
    required this.person,
    required this.creationDate,
    required this.vigilAddress,
    required this.burialAddress,
    this.photoUrl = '',
    this.message = '',
  });

  factory ObituaryModel.fromJson(Map<String, dynamic> json) {
    return ObituaryModel(
      id: Utils.getStringFromDynamic(json[ObituaryEnum.id.name]),
      photoUrl: Utils.getUrlFromDynamic(json[ObituaryEnum.photoUrl.name]),
      person: PersonModel.fromJson(
        Utils.mapFromDynamic(json[ObituaryEnum.person.name]),
      ),
      creationDate:
          DateUtils.dateTimeFromDynamic(json[ObituaryEnum.creationDate.name]),
      vigilAddress: AddressModel.fromJson(
        Utils.mapFromDynamic(json[ObituaryEnum.vigilAddress.name]),
      ),
      burialAddress: AddressModel.fromJson(
        Utils.mapFromDynamic(json[ObituaryEnum.burialAddress.name]),
      ),
      message: Utils.getStringFromDynamic(json[ObituaryEnum.message.name]),
    );
  }

  final String id;
  final String photoUrl;
  final PersonModel person;
  final DateTime creationDate;
  final AddressModel vigilAddress;
  final AddressModel burialAddress;
  final String message;

  @override
  ObituaryModel copyWith({
    String? id,
    String? photoUrl,
    PersonModel? person,
    DateTime? creationDate,
    AddressModel? vigilAddress,
    AddressModel? burialAddress,
    String? msg,
  }) {
    return ObituaryModel(
      id: id ?? this.id,
      person: person ?? this.person,
      creationDate: creationDate ?? this.creationDate,
      vigilAddress: vigilAddress ?? this.vigilAddress,
      burialAddress: burialAddress ?? this.burialAddress,
      message: msg ?? this.message,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      ObituaryEnum.id.name: id,
      ObituaryEnum.photoUrl.name: Utils.isValidUrl(photoUrl) ? photoUrl : '',
      ObituaryEnum.person.name: person.toJson(),
      ObituaryEnum.vigilAddress.name: vigilAddress.toJson(),
      ObituaryEnum.burialAddress.name: burialAddress.toJson(),
      ObituaryEnum.creationDate.name: DateUtils.dateTimeToString(creationDate),
      ObituaryEnum.message.name: message,
    };
  }

  @override
  int get hashCode =>
      id.hashCode ^
      photoUrl.hashCode ^
      person.hashCode ^
      vigilAddress.hashCode ^
      burialAddress.hashCode ^
      message.hashCode ^
      creationDate.hashCode;

  @override
  bool operator ==(Object other) {
    return identical(other, this) ||
        other is ObituaryModel &&
            other.runtimeType == runtimeType &&
            other.id == id &&
            other.photoUrl == photoUrl &&
            other.person == person &&
            other.vigilAddress == vigilAddress &&
            other.burialAddress == burialAddress &&
            other.message == message &&
            other.creationDate == creationDate;
  }

  @override
  String toString() {
    return '${toJson()}';
  }
}
