import 'package:QuizApp/screens/quiz_screen.dart';
import 'package:QuizApp/widgets/dashboard_item.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> _subjects = ['General' , 'Maths' ,];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("ALL SUBJECTS"),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, i) => InkWell(child: DashboardItem(_subjects[i]),onTap: (){
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => QuizScreen(_subjects[i],i)));
        },),
        itemCount: _subjects.length,
      ),
    );
  }
}
