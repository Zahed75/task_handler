import 'package:flutter/material.dart';
import 'package:task_handler/api/apiClient.dart';
import 'package:task_handler/component/appBottomNav.dart';
import 'package:task_handler/component/taskList.dart';
import 'package:task_handler/style/style.dart';



class progressTaskList extends StatefulWidget{

  const progressTaskList({Key? key}):super(key:key);
  
  @override
  State<progressTaskList> createState()=> _progressTaskList();
  
}


class _progressTaskList extends State<progressTaskList> {
  List Taskitems = [];
  bool Loading = true; // Set Loading to true initially
  String Status="Progress";
  @override
  void initState() {
    super.initState();
    callData(); // Fetch the data when the widget is initialized
  }

  callData() async {
    var data = await TaskListRequest("New");
    if (!mounted) return; // Check if the widget is still mounted
    setState(() {
      Loading = false; // Set Loading to false after data is fetched
      Taskitems = data; // Update the Taskitems list
    });
  }

  int bottomtabIndex = 0;
  onItemTapped(index) {
    setState(() {
      bottomtabIndex = index;
    });
  }

   DeletedItem(id)async{
    showDialog(
      context: context, 
      builder: (BuildContext context){
        return AlertDialog(
          title:Text('Delete'),
          content:Text("Once You Delete, you cant it back"),
          actions: [
            OutlinedButton(onPressed: ()async{
              Navigator.pop(context);
              setState(() {Loading=true;});
              await TaskDeleteRequest(id);
              await callData();
            }, child: Text("Yes")),
            OutlinedButton(onPressed: (){
                Navigator.pop(context);
            }, child: Text("No"))
          ],
        );
      }
      
      );
  }



  UpdateStatus(id) async{
    setState(() {Loading=true;});
    await TaskUpdateRequest(id,Status);
    await callData();
    setState(() {Status = "Progress";});
  }


  StatusChange(id) async{
    showModalBottomSheet(context: context,
        builder: (context){
        return StatefulBuilder(
            builder: (BuildContext context,StateSetter setState){
               return Container(
                  padding: EdgeInsets.all(30),
                  height: 360,
                  child:Column(
                     mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        RadioListTile(title: Text("New"), value: "New", groupValue: Status,
                          onChanged: (value){
                            setState(() {
                              Status = value.toString();
                            });
                          },
                        ),
                        RadioListTile(title: Text("Progress"), value: "Progress", groupValue: Status,
                          onChanged: (value){
                            setState(() {
                              Status = value.toString();
                            });
                          },
                        ),
                        RadioListTile(title: Text("Completed"), value: "Completed", groupValue: Status,
                          onChanged: (value){
                            setState(() {
                              Status = value.toString();
                            });
                          },
                        ),
                        RadioListTile(title: Text("Canceled"), value: "Canceled", groupValue: Status,
                          onChanged: (value){
                            setState(() {
                              Status = value.toString();
                            });
                          },
                        ),
                        Container(child: ElevatedButton(
                          style: AppButtonStyle(),
                          child: SuccessButtonChild('Confirm'),
                          onPressed: (){
                            Navigator.pop(context);
                            UpdateStatus(id);
                          },
                        ),)
                      ],
                  ),
               );
            }
        );
      }
    );
  }





  @override
  Widget build(BuildContext context) {
    return Loading
        ? Center(child: CircularProgressIndicator())
        : RefreshIndicator(
            onRefresh: () async {
              callData();
            },
            child: TaskList(Taskitems,DeletedItem,StatusChange),
          );
  }
}
