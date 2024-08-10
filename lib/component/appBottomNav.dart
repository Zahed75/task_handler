import 'package:flutter/material.dart';
import 'package:task_handler/style/style.dart';

BottomNavigationBar appBottomNav(currentIndex, onItemTapped){
  return BottomNavigationBar(
    items: [
      BottomNavigationBarItem(
        icon: Icon(Icons.list_alt),
        label:"New"
        ),
           BottomNavigationBarItem(
        icon: Icon(Icons.access_time_rounded),
        label:"Progress"
        ),
           BottomNavigationBarItem(
        icon: Icon(Icons.check_circle_outline),
        label:"Completed"
        ),
           BottomNavigationBarItem(
        icon: Icon(Icons.cancel),
        label:"Cancelled"
        ),
    ],
    selectedItemColor: colorOrange,
    unselectedItemColor: colorLightGray,
    currentIndex: currentIndex,
    showSelectedLabels: true,
    showUnselectedLabels: true,
    onTap:  onItemTapped,
    type:BottomNavigationBarType.fixed,

  );
}