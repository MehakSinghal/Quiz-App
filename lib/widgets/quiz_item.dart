import 'package:flutter/material.dart';

class QuizItem extends StatefulWidget {
  Map<String, dynamic> data;
  int number;
  Function score;
  //QuizItem(this.data, this.number, this.score);

  @override
  _QuizItemState createState() => _QuizItemState();
}

class _QuizItemState extends State<QuizItem> {
  List<bool> x ;
  int selected;

  @override
  void initState() {
   selected = -1;
   x = [false, false, false, false];
    super.initState();
  }

  void selectedVal(int val){
    setState(() {
      selected = val;
      for(int k=0 ; k<4 ;k++){
        if(x[k]){
          x[k]=false;
          widget.score(-widget.data['Answer'][k]['score']);
        }
      }
      x[val]=!x[val];
      if(x[val]){
        widget.score(widget.data['Answer'][val]['score']);
      }
      else{
        widget.score(-widget.data['Answer'][val]['score']);
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 330,
      margin: EdgeInsets.only(top: 15, right: 15, left: 15),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        border: Border.all(color: Colors.blue, width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            (widget.number + 1).toString() + ". " + widget.data['Question'],
            style: TextStyle(
                color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 20),
          ),
          RadioListTile(
            activeColor: Colors.blue,
            value: 0,
            title: Text(widget.data['Answer'][0]['text']),
            groupValue: selected,
            onChanged: (val){
              selectedVal(val);
            },
            selected: x[0],
          ),
          RadioListTile(
            activeColor: Colors.blue,
            value: 1,
            title: Text(widget.data['Answer'][1]['text']),
            groupValue: selected,
            onChanged: (val){
              selectedVal(val);
            },
            selected: x[1],
          ),
          RadioListTile(
            activeColor: Colors.blue,
            value: 2,
            title: Text(widget.data['Answer'][2]['text']),
            groupValue: selected,
            onChanged: (val){
              selectedVal(val);
            },
            selected: x[2],
          ),
          RadioListTile(
            activeColor: Colors.blue,
            value: 3,
            title: Text(widget.data['Answer'][3]['text']),
            groupValue: selected,
            onChanged: (val){
              selectedVal(val);
            },
            selected: x[3],
          ),
        ],
      ),
    );
  }
}
