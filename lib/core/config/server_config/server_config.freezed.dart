// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'server_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ServerConfig {

 String get ip; int get port;
/// Create a copy of ServerConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServerConfigCopyWith<ServerConfig> get copyWith => _$ServerConfigCopyWithImpl<ServerConfig>(this as ServerConfig, _$identity);

  /// Serializes this ServerConfig to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServerConfig&&(identical(other.ip, ip) || other.ip == ip)&&(identical(other.port, port) || other.port == port));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ip,port);

@override
String toString() {
  return 'ServerConfig(ip: $ip, port: $port)';
}


}

/// @nodoc
abstract mixin class $ServerConfigCopyWith<$Res>  {
  factory $ServerConfigCopyWith(ServerConfig value, $Res Function(ServerConfig) _then) = _$ServerConfigCopyWithImpl;
@useResult
$Res call({
 String ip, int port
});




}
/// @nodoc
class _$ServerConfigCopyWithImpl<$Res>
    implements $ServerConfigCopyWith<$Res> {
  _$ServerConfigCopyWithImpl(this._self, this._then);

  final ServerConfig _self;
  final $Res Function(ServerConfig) _then;

/// Create a copy of ServerConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ip = null,Object? port = null,}) {
  return _then(_self.copyWith(
ip: null == ip ? _self.ip : ip // ignore: cast_nullable_to_non_nullable
as String,port: null == port ? _self.port : port // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _ServerConfig implements ServerConfig {
  const _ServerConfig({required this.ip, required this.port});
  factory _ServerConfig.fromJson(Map<String, dynamic> json) => _$ServerConfigFromJson(json);

@override final  String ip;
@override final  int port;

/// Create a copy of ServerConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ServerConfigCopyWith<_ServerConfig> get copyWith => __$ServerConfigCopyWithImpl<_ServerConfig>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ServerConfigToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ServerConfig&&(identical(other.ip, ip) || other.ip == ip)&&(identical(other.port, port) || other.port == port));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ip,port);

@override
String toString() {
  return 'ServerConfig(ip: $ip, port: $port)';
}


}

/// @nodoc
abstract mixin class _$ServerConfigCopyWith<$Res> implements $ServerConfigCopyWith<$Res> {
  factory _$ServerConfigCopyWith(_ServerConfig value, $Res Function(_ServerConfig) _then) = __$ServerConfigCopyWithImpl;
@override @useResult
$Res call({
 String ip, int port
});




}
/// @nodoc
class __$ServerConfigCopyWithImpl<$Res>
    implements _$ServerConfigCopyWith<$Res> {
  __$ServerConfigCopyWithImpl(this._self, this._then);

  final _ServerConfig _self;
  final $Res Function(_ServerConfig) _then;

/// Create a copy of ServerConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ip = null,Object? port = null,}) {
  return _then(_ServerConfig(
ip: null == ip ? _self.ip : ip // ignore: cast_nullable_to_non_nullable
as String,port: null == port ? _self.port : port // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
