
import 'package:json_annotation/json_annotation.dart';
part 'netflix_model.g.dart';

@JsonSerializable()
class NetflixModel{
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "release_date")
  String? date;
  @JsonKey(name: "poster_path")
  String? image;
  @JsonKey(name: "overview")
  String? description;

  NetflixModel({
    required this.title,
     required this.date,
      required this.image,
       required this.description,
  });



}
 