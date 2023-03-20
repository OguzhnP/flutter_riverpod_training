import 'dart:convert';

class SuggestionModel {
  SuggestionModel({
    required this.activity,
    required this.type,
  });

  String activity;
  String type;

  factory SuggestionModel.fromRawJson(String str) =>
      SuggestionModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SuggestionModel.fromJson(Map<String, dynamic> json) =>
      SuggestionModel(
        activity: json["activity"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "activity": activity,
        "type": type,
      };
}
