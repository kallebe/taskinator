import 'package:flutter/material.dart';
import 'package:taskinator/components/my_box_shadow.dart';

class TaskElement extends StatelessWidget {

  TaskElement(this.titulo);

  final String titulo;    //TODO: Mudar para objeto
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: MyBoxShadow(),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                titulo, //* Título da tarefa
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                  color: Colors.black87
                ),
              ),
              SizedBox(height: 4.0),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.timer,
                    color: Colors.grey,
                    size: 18.0,
                  ),
                  Text(
                    "14h30",  //* Data de entrega
                    style: TextStyle( color: Colors.grey ),
                  )
                ],
              )
            ],
          ),
          Container(
            width: 8.0,
            height: 32.0,
            decoration: BoxDecoration(
              color: Colors.amber, //TODO: Filter color
              borderRadius: BorderRadius.circular(4.0)
            ),
          )
        ],
      ),
    );
  }
}