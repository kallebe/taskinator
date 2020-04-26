import 'package:flutter/material.dart';
import 'package:taskinator/components/box_shadow_component.dart';
import 'package:taskinator/helpers/filter_helper.dart';
import 'package:taskinator/models/filter_model.dart';

class FilterElement extends StatelessWidget {

  final FilterModel filter;
  final bool isSelected;

  FilterElement(this.filter, this.isSelected);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: (){},
        onLongPress: () {
          showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: Text("Editar Categoria"),
              actions: <Widget>[
                FlatButton(
                  onPressed: (){
                    FilterHelper().deleteFilter(filter);
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Excluir",
                    style: TextStyle(
                      color: Colors.red
                    ),
                  )
                )
              ],
            )
          );
        },
        child: Container(
          decoration: BoxDecoration(
            boxShadow: boxShadowComponent(),
            borderRadius: BorderRadius.circular(15),
            color: isSelected ? filter.color : Colors.grey[200],
          ),
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
          child: Text(
            filter.title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black87,
            ),
          ),
        ),
      ),
    );
  }
}