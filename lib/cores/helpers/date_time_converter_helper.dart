import 'package:json_annotation/json_annotation.dart';

class DateTimeConverterHelper implements JsonConverter<DateTime?, String?> {
  const DateTimeConverterHelper();

  @override
  DateTime? fromJson(String? json) =>
      json != null ? DateTime.tryParse(json) : null;

  @override
  String? toJson(DateTime? dateTime) {
    return dateTime?.toIso8601String();
  }
}
