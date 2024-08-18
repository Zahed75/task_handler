import 'package:flutter/material.dart';
import 'package:task_handler/style/style.dart';


ListView TaskList(Taskitems){

  return ListView.builder(

      itemCount: Taskitems.length,
      itemBuilder: (context,index){
      Color statusColor=colorGreen;
      if(Taskitems[index]['status']=="New"){
        statusColor=colorBlue;
      }
      else if(Taskitems[index]['status']=="Progress"){
        statusColor=colorOrange;
      }
      else if(Taskitems[index]['status']=="Cancelled"){
        statusColor=colorRed;
      }
        return Card(

            child:ItemSizeBox(
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(Taskitems[index]['title'],style:Head6Text(colorBlue),),
                  Text(Taskitems[index]['description'],style:Head7Text(colorLightGray),),
                  Text(Taskitems[index]['createdDate'],style:Head9Text(colorDarkBlue),),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      StatusChild(Taskitems[index]['status'],statusColor),
                      Container(
                        child: Row(
                          children: [
                           SizedBox(width: 50,height:30,child:ElevatedButton(onPressed:(){},child: Icon(Icons.edit_location_alt_outlined,size: 16),style:AppStatusButtonStyle(colorBlue))),
                           SizedBox(width: 10,),
                           SizedBox(width: 50,height: 30,child: ElevatedButton( onPressed:(){ }, child: Icon(Icons.delete_outlined,size: 16),style:AppStatusButtonStyle(colorRed))),

                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
        );
      },
    );
}

