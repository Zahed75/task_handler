import 'package:flutter/material.dart';
import 'package:task_handler/style/style.dart';


ListView TaskList(Taskitems){
  return ListView.builder(
      itemCount: Taskitems.length,
      itemBuilder: (context,index){
        return Card(
            child:ItemSizeBox(
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(Taskitems[index]['title'],style:Head6Text(colorBlue),),
                  Text(Taskitems[index]['description'],style:Head7Text(colorLightGray),),

                ],
              ),
            ),
        );
      },
    );
}