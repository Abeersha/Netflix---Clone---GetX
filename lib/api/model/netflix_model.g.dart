// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'netflix_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetflixModel _$NetflixModelFromJson(Map<String, dynamic> json) => NetflixModel(
      title: json['title'] as String?,
      date: json['release_date'] as String?,
      image: json['poster_path'] as String?,
      description: json['overview'] as String?,
    );

Map<String, dynamic> _$NetflixModelToJson(NetflixModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'release_date': instance.date,
      'poster_path': instance.image,
      'overview': instance.description,
    };
