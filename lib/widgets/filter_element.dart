import 'package:flutter/material.dart';
import 'package:taskinator/components/my_box_shadow.dart';
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
        child: Container(
          decoration: BoxDecoration(
            boxShadow: MyBoxShadow(),
            borderRadius: BorderRadius.circular(15),
            color: isSelected ? filter.color : Colors.grey[200],
          ),
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
          child: Text(
            filter.titulo,
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