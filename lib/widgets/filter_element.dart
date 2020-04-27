import 'package:flutter/material.dart';
import 'package:taskinator/components/box_shadow_component.dart';
import 'package:taskinator/components/form_filter_dialog.dart';
import 'package:taskinator/models/filter_model.dart';
import 'package:taskinator/stores/filters_store.dart';

class FilterElement extends StatelessWidget {

  final FilterModel filter;
  final bool isSelected;
  final FiltersStore filtersStore;

  FilterElement({this.filter, this.isSelected, this.filtersStore});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: filter == null ? (){
          formFilterDialog(context, filtersStore);
        } : () {},
        onLongPress: filter != null ? () {
          formFilterDialog(context, filtersStore, filter: filter);
        } : (){},
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            boxShadow: boxShadowComponent(),
            borderRadius: BorderRadius.circular(15),
            color: (isSelected != null && isSelected) ? filter.color : Colors.grey[200],
          ),
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
          child: filter != null ?
          Text(
            filter.title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black87,
            ),
          ) :
          Icon(
            Icons.add,
            color: Colors.black87,
            size: 18.0,
          ),
        ),
      ),
    );
  }
}