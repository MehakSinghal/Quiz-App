import 'package:flutter/material.dart';

class DashboardItem extends StatelessWidget {
  String title;
  DashboardItem(this.title);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15, right: 15, left: 15),
      height: 100,
      width: 330,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          border: Border.all(color: Colors.blue, width: 2),
          color: Color.fromRGBO(229, 243, 255, 0).withOpacity(1)),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
              color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 30),
        ),
      ),
    );
  }
}
