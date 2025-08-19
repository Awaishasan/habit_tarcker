import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_popup_menu_button/custom_popup_menu_button.dart';
import 'package:provider/provider.dart';

import '../controller/home_Provider/home_controller.dart';

enum Menu { edit, delete }

class popMenuButton extends StatelessWidget {
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  const popMenuButton(
      {super.key, required this.onEdit, required this.onDelete});

  @override
  Widget build(BuildContext context) {


    return PopupMenuButton(
      onSelected: (Menu item ){
        if(item == Menu.edit){

          onEdit();
        }else if(item == Menu.delete){
          onDelete();

        }

      },
        icon: Icon(Icons.more_vert),
        itemBuilder: (BuildContext context) => <PopupMenuEntry<Menu>>[
              PopupMenuItem(
                value: Menu.edit,
                  child: ListTile(

                leading: Icon(Icons.edit),
                title: Text('Edit'),
              )),
              PopupMenuItem(
                value: Menu.delete,
                  child: ListTile(

                leading: Icon(Icons.delete),
                title: Text('Delete'),
              )),
            ]

    );
  }
}
