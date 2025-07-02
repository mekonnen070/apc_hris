// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'server_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ServerConfig _$ServerConfigFromJson(Map<String, dynamic> json) =>
    _ServerConfig(
      ip: json['ip'] as String,
      port: (json['port'] as num).toInt(),
    );

Map<String, dynamic> _$ServerConfigToJson(_ServerConfig instance) =>
    <String, dynamic>{'ip': instance.ip, 'port': instance.port};
