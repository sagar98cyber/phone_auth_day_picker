import 'package:basic_ui/global.dart';
import 'package:basic_ui/play.dart';
import 'package:flutter/material.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:day_picker/day_picker.dart';

class weekPickr extends StatefulWidget {

  @override
  _weekPickrState createState() => _weekPickrState();
}

class _weekPickrState extends State<weekPickr> {
/*  bool startTimeSelected = false;
  bool endTimeSelected = false;

  TimeOfDay picked;
  String finl;
 TimeOfDay _time = TimeOfDay.now();
  DateTime _dateTimes = DateTime.now();
  DateTime _dateTimee = DateTime.now();

  DateTime _dateTime = DateTime.now();


  void handleOnSelect(List<String> value) {
    //TODO: Manipulate the List of days selected
    print(value);
  }*/
  List<Widget> children = new List<Widget>();
  int count =0;
  var myrooms = List();
  Future<bool> query() async {
    myrooms = [];
    children = [];
    var allrows = data.room;
    allrows.forEach((row) {
      myrooms.add(row.toString());
      children.add(Card(
        elevation: 5.0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal:8.0),
          child: ListTile(
            title: Container(
              child: Column(
                children: [
                  Text(row['rrepeat']),
                  Text(row['rtime']),
                  Text(row['rdescription']),
                  Text(row['rname']),
                ],
              ),
            ),
            trailing: Padding(
              padding: const EdgeInsets.only(bottom:8.0),
              child: Container(
                //height: MediaQuery,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      GestureDetector(
                        child: Icon(
                          Icons.play_arrow_rounded,
                          size: 50,
                          color: data.start,
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => play()),
                          );
                          /*data.room(row['rid']);
                          data.room.remove([row['rname']]);
                          print(data.room);
                          setState(() {});
                          queryall();
                          _delete(context, noteList[position]);*/
                        },
                      ),
                      GestureDetector(
                        child: Icon(
                          Icons.ac_unit,
                          size: 40,
                          color: data.start,
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => play()),
                          );
                          /*data.room(row['rid']);
                          data.room.remove([row['rname']]);
                          print(data.room);
                          setState(() {});
                          queryall();
                          _delete(context, noteList[position]);*/
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom:8.0),
                        child: GestureDetector(
                          child: Icon(
                            Icons.delete,
                            size: 40,
                            color: data.end,
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => delet()),
                            );
                            //data.room(row['rid']);
                            data.room.remove([row['rname']]);
                            print(data.room);
                            setState(() {});
                            //queryall();
                            //_delete(context, noteList[position]);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ));
    });
    return Future.value(true);
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(builder: (context,snap){
      return Scaffold(
        appBar: AppBar(title:Text('asdasd')),
        body: SingleChildScrollView(
          child: Column(
            children: children,
          ),
        ),
      );
    },
      future: query(),
    );
      /*Scaffold(
        body:Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child:Container(),
            /* SelectWeekDays(
              border: false,
              boxDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
               /* gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  colors: [const Color(0xFFE55CE4), const Color(0xFFBB75FB)],
                  tileMode:
                  TileMode.repeated, // repeats the gradient over the canvas
                ),*/
              ),
              onSelect: (values) { // <== Callback to handle the selected days
                print(values);
                setState(() {
                  finl = values.toString();
                });
              },
            ),*/
          ),
        ),
      );*/
      /*Padding(
      padding: const EdgeInsets.all(8.0),
      child: SelectWeekDays(
        onSelect: (values) {
          print(values);
        },
      ),
    );*/
  }
}