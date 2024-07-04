import 'package:equatable/equatable.dart';

class ItemDropdownModel<T> extends Equatable {
  final String text;
  final T value;

  const ItemDropdownModel({required this.text, required this.value});

  @override
  toString() {
    return 'Text : $text; Value : $value';
  }

  @override
  List<Object?> get props => [text, value];
}

class ItemPicker {
  int? id;
  String? title;
  dynamic value;

  ItemPicker({
    this.id,
    this.title,
    this.value,
  });
}
