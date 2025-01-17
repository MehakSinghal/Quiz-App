import 'package:QuizApp/widgets/quiz_item.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class QuizScreen extends StatefulWidget {
  String title;
  int i;

  QuizScreen(this.title, this.i);

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _result = 0;

  void totalScore(int score) {
    _result = _result + score;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: FutureBuilder(
        builder: (context, snapshot) {
          var showData = json.decode(snapshot.data.toString());
          if (snapshot.hasData) {
            return SingleChildScrollView(
              physics: ScrollPhysics(),
              child: Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return QuizItem(
                          showData[widget.i][index], index, totalScore);
                    },
                    itemCount: showData[widget.i].length,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  RaisedButton(
                    child: Text(
                      "Submit and show score",
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.blue,
                    onPressed: () {
                      showDialog(
                        barrierDismissible: false,
                          context: context,
                          builder: (ctx) => AlertDialog(
                                title: Text(
                                  "Total Score is " + _result.toString(),
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold),
                                ),
                            actions: [
                              FlatButton(child: Text("DONE"), onPressed: (){
                                Navigator.of(context).pop();
                                Navigator.of(context).pop();
                              },)
                            ],
                              ));
                    },
                  ),
                ],
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
        future:
            DefaultAssetBundle.of(context).loadString("assets/SubData.json"),
      ),
    );
  }
}
