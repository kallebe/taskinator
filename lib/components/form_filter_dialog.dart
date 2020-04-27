import 'package:flutter/material.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:taskinator/components/box_shadow_component.dart';
import 'package:taskinator/components/form_field_component.dart';
import 'package:taskinator/components/text_field_component.dart';
import 'package:taskinator/models/filter_model.dart';
import 'package:taskinator/stores/filter_form_store.dart';
import 'package:taskinator/stores/filters_store.dart';

void formFilterDialog(BuildContext context, FiltersStore filtersStore, {FilterModel filter}) {
  bool create = filter == null;
  final FilterForm filterForm = FilterForm();
  final TextEditingController tituloController = TextEditingController();

  showDialog(
    context: context,
    builder: (_) => Observer(
      builder: (_) {
        return AlertDialog(
          title: Text(create ? "Nova categoria" : "Editar Categoria"),
          content: _buildContent(context, filterForm, tituloController),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                if (!create)
                  FilterModel.deleteFilter(filter);
                Navigator.of(context).pop();
              },
              child: Text(
                create ? "Cancelar" : "Deletar",
                style: TextStyle(color: create ? Colors.grey : Colors.red),
              ),
            ),
            //! tituloController.text.isEmpty ?
            FlatButton(
              onPressed: () {
                FilterModel filter = FilterModel(tituloController.text, filterForm.color);
                print(tituloController.text + ", " + filterForm.color.toString());
                create ? FilterModel.saveFilter(filter) : FilterModel.updateFilter(filter);
                Navigator.of(context).pop();
              },
              child: Text(
                create ? "Criar" : "Salvar",
                style: TextStyle(color: Theme.of(context).accentColor),
              ),
            )
            //! SizedBox(width: 0,)
          ],
        );
      },
    )
  );
}

Widget _buildContent(BuildContext context, FilterForm filterForm, TextEditingController tituloController) {

  return Container(
    padding: EdgeInsets.all(8.0),
    child: ListView(
      shrinkWrap: true,
      children: <Widget>[
        formFieldComponent("Título", textFieldComponent(tituloController, hint: "Ex.: Estudos", filterForm: filterForm)),
        _selectColor(filterForm)
      ],
    ),
  );
}

Widget _selectColor(FilterForm filterForm) {
  return LimitedBox(
    maxHeight: 200,
    child: Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        boxShadow: boxShadowComponent(),
        color: Colors.white
      ),
      child: MaterialColorPicker(
        selectedColor: filterForm.color,
        onColorChange: (c) { filterForm.setColor(c); },
      ),
    ),
  );
}