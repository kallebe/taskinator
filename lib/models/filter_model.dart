import 'package:flutter/painting.dart';

class FilterModel {
  String _titulo;
  Color _color;

  FilterModel(this._titulo, this._color);

  String get titulo => _titulo;
  Color get color => _color;
}