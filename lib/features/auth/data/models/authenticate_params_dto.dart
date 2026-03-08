import 'package:json_annotation/json_annotation.dart';

part 'authenticate_params_dto.g.dart';

@JsonSerializable()
class AuthenticateParamsDto {
  final String email;
  final String? name;
  final String? image;
  final String providerId;
  final String accountId;
  final String? accessToken;
  final String? idToken;
  final String? refreshToken;
  final DateTime? expiresAt;
  final String? ipAddress;
  final String? userAgent;

  AuthenticateParamsDto({
    required this.email,
    this.name,
    this.image,
    required this.providerId,
    required this.accountId,
    this.accessToken,
    this.idToken,
    this.refreshToken,
    this.expiresAt,
    this.ipAddress,
    this.userAgent,
  });

  factory AuthenticateParamsDto.fromJson(Map<String, dynamic> json) =>
      _$AuthenticateParamsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AuthenticateParamsDtoToJson(this);
}
