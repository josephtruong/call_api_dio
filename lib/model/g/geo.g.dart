// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../geo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Geo _$GeoFromJson(Map<String, dynamic> json) {
  return Geo(
    city: json['city'] as String,
    country: json['country'] as String,
    street: json['street'] == null
        ? null
        : Street.fromJson(json['street'] as Map<String, dynamic>),
    coordinates: json['coordinates'] == null
        ? null
        : Coordinates.fromJson(json['coordinates'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$GeoToJson(Geo instance) => <String, dynamic>{
      'city': instance.city,
      'country': instance.country,
      'street': instance.street,
      'coordinates': instance.coordinates,
    };
