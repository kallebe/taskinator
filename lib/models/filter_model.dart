import 'package:flutter/painting.dart';

class FilterModel {
  int id;
  String titulo;
  Color color;

  FilterModel(this.titulo, this.color);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': titulo,
      'color': color.value
    };
  }

  FilterModel.fromMap(Map<String, dynamic> data) {
    id = data["id"];
    titulo = data["title"];
    color = Color(int.parse(data["color"]));
  }
}