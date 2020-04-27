// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_form_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FilterForm on _FilterFormBase, Store {
  Computed<bool> _$isTitleValidatedComputed;

  @override
  bool get isTitleValidated => (_$isTitleValidatedComputed ??=
          Computed<bool>(() => super.isTitleValidated))
      .value;

  final _$colorAtom = Atom(name: '_FilterFormBase.color');

  @override
  Color get color {
    _$colorAtom.context.enforceReadPolicy(_$colorAtom);
    _$colorAtom.reportObserved();
    return super.color;
  }

  @override
  set color(Color value) {
    _$colorAtom.context.conditionallyRunInAction(() {
      super.color = value;
      _$colorAtom.reportChanged();
    }, _$colorAtom, name: '${_$colorAtom.name}_set');
  }

  final _$titleAtom = Atom(name: '_FilterFormBase.title');

  @override
  String get title {
    _$titleAtom.context.enforceReadPolicy(_$titleAtom);
    _$titleAtom.reportObserved();
    return super.title;
  }

  @override
  set title(String value) {
    _$titleAtom.context.conditionallyRunInAction(() {
      super.title = value;
      _$titleAtom.reportChanged();
    }, _$titleAtom, name: '${_$titleAtom.name}_set');
  }

  final _$_FilterFormBaseActionController =
      ActionController(name: '_FilterFormBase');

  @override
  void setColor(Color c) {
    final _$actionInfo = _$_FilterFormBaseActionController.startAction();
    try {
      return super.setColor(c);
    } finally {
      _$_FilterFormBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTitle(String t) {
    final _$actionInfo = _$_FilterFormBaseActionController.startAction();
    try {
      return super.setTitle(t);
    } finally {
      _$_FilterFormBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'color: ${color.toString()},title: ${title.toString()},isTitleValidated: ${isTitleValidated.toString()}';
    return '{$string}';
  }
}
