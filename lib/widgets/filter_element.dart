import 'package:flutter/material.dart';
import 'package:taskinator/components/my_box_shadow.dart';

class FilterElement extends StatelessWidget {

  final String title;
  final bool isSelected;

  FilterElement(this.title, this.isSelected);

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
            color: isSelected ? Theme.of(context).accentColor : Colors.grey[200],
          ),
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
          child: Text(
            title,
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