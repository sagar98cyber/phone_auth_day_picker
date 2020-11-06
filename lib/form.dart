import 'package:basic_ui/timepicker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:day_picker/day_picker.dart';
import 'global.dart';

class createroom extends StatefulWidget {
  @override
  _createroomState createState() => _createroomState();
}

class _createroomState extends State<createroom> {
  //global g = new global();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: /*Center(
        child: Text("${global.pnumber}"),
      ),*/
          FormScreen(),
    );
  }
}

class FormScreen extends StatefulWidget {
  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  String _rname;
  String _rtimehr;
  String _rlimit;
  String _rrepeat;
  String finl;
  String _rdesc;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    String s = _dateTime.hour.toString().padLeft(2, '0') +
        ':' +
        _dateTime.minute.toString().padLeft(2, '0');
    final MediaQueryData _mediaQueryData = MediaQuery.of(context);

    final _screenWidth = _mediaQueryData.size.width;
    final _screenHeight = _mediaQueryData.size.height;
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  _buildrNameField(),
                  _buildrlimit(),
                  //_buildrrepeat(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SelectWeekDays(
                      border: false,
                      boxDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,

                          colors: [

                            data.start,
                            data.end
                          ],
                          tileMode: TileMode
                              .repeated, // repeats the gradient over the canvas
                        ),
                      ),
                      onSelect: (values) {
                        // <== Callback to handle the selected days
                        print(values);
                        setState(() {
                          finl = values.toString();
                        });
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        child: Column(
                          children: <Widget>[
                            hourMinute12H(),
                            //hourMinute15Interval(),
                            //hourMinuteSecond(),
//                           hourMinute12HCustomStyle(),
                            new Container(
                              /*margin: EdgeInsets.symmetric(
                    vertical: 50
                ),*/
                              child: new Text(
                                '$s'
                                /* + ':' +
                      _dateTime.second.toString().padLeft(2, '0')*/
                                ,
                                style: TextStyle(
                                  color: data.pur,
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        child: _buildtimehr(),
                        //height: 150,
                        width: _screenWidth / 5,
                      ),
                      /*SizedBox(
                        child:
                        _buildtimem(),
                        //height: 150,
                        width: _screenWidth/5,
                      ),
                      SizedBox(
                        child:
                        _buildtimem(),
                        //height: 150,
                        width: _screenWidth/5,
                      ),*/
                    ],
                  ),
                  /*   Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        TextFormField(

                          keyboardType: TextInputType.datetime,
                          decoration: InputDecoration(labelText: 'Hr'),
                          onSaved: (String value) {
                            setState(() {
                              _rtimehr = value;
                            });
                          },
                          validator: (String value) {
                            if (value.isEmpty) {
                              return 'Time cannot be empty';
                            }
                            int calories = int.tryParse(value);

                            if (calories == null || calories <= 0) {
                              return 'Cannot be 0 or anything apart from natural number';
                            }

                            if(calories < 0 && calories>12){
                              return 'please enter time in 12H format';
                            }
                          },
                        ),
                        TextFormField(

                          keyboardType: TextInputType.datetime,
                          decoration: InputDecoration(labelText: 'Min'),
                          onSaved: (String value) {
                            setState(() {
                              _rtimem = value;
                            });
                          },
                          validator: (String value) {
                            if (value.isEmpty) {
                              return 'Time cannot be empty';
                            }
                            int calories = int.tryParse(value);

                            if (calories == null || calories <= 0) {
                              return 'Cannot be 0 or anything apart from natural number';
                            }

                            if(calories < 0 && calories>12){
                              return 'please enter time in 12H format';
                            }
                            /* Pattern pattern =
            r'/^\(?(\d{3})\)?[- ]?(\d{3})[- ]?(\d{4})$/';
        RegExp regex = new RegExp(pattern);
        if (!regex.hasMatch(value))
          return 'Enter Valid Phone Number';
        else
          return null;*/
                            /*if(!RegExp('/^(\+\d{1,3}[- ]?)?\d{10}$/').hasMatch(value)){
              return ;
        }*/
                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text('data'),
                        Text(''),
                      ],
                    ),
                  ),*/

                  RaisedButton(
                      child: Text('Submit'),
                      onPressed: () {
                        if (!_formKey.currentState.validate()) {
                          return;
                        }
                        _formKey.currentState.save();
                        print("$_rname");
                        //print("$_rtime");
                        print("$_rtimehr");
                        print("$_rlimit");
                        print("$_rrepeat");
                        // print("$_rlimit");
                        print("$s");
                        print("$finl");
                        data.room.add({
                          "rname":"$_rname",
                          "rrepeat":"$finl",
                          "rdescription":"$_rdesc",
                          "rtime":"$s",
                          "duration":"$_rtimehr",
                          "rlimit":"$_rlimit"
                        });
                        // insertdata();
                      }),
                  /*IconButton(
                      icon: Icon(Icons.arrow_forward_ios),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => NumPick()),
                        );
                      }),*/
                  IconButton(
                      icon: Icon(Icons.arrow_forward_ios),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => weekPickr()),
                        );
                      }),
                  /*RaisedButton(
                    //onPressed: delete,
                    child: Text("delete"),
                  ),*/
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /*void insertdata() async {
    Map<String, dynamic> row = {
      DatabaseHelper.rname: _rname,
      DatabaseHelper.rlimit: _rlimit,
    };
    final id = await dbHelper.insert(row);
    print(id);
    queryall();
  }

  void delete() async {
    var id = await dbHelper.deletedata(3);
  }

  void queryall() async {
    var allrows = await dbHelper.queryall();
    int i = allrows.length;
    allrows.forEach((element) {
      print(element);
    });
  }*/

  Widget _buildrNameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Name'),
      keyboardType: TextInputType.text,
      onSaved: (String value) {
        _rname = value;
        // print("$_rname");
      },
      validator: (String value) {
        if (value.isEmpty) {
          return 'Room name cannot be empty';
        }
        if (!RegExp(r'(^[a-zA-Z ]*$)').hasMatch(value)) {
          return 'PLease enter a valid room name';
        }
      },
    );
  }
  Widget _buildDescField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Desc'),
      keyboardType: TextInputType.text,
      onSaved: (String value) {
        _rdesc = value;
        // print("$_rname");
      },
      validator: (String value) {
        if (value.isEmpty) {
          return 'Room name cannot be empty';
        }
        if (!RegExp(r'(^[a-zA-Z ]*$)').hasMatch(value)) {
          return 'PLease enter a valid room name';
        }
      },
    );
  }
  /*Widget _buildrrepeat() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Repeat'),
      onSaved: (String value) {
        _rrepeat = value;
      },
      validator: (String value) {
        if (value.isEmpty) {
          return 'Room repeat cannot be empty';
        }
        if (!RegExp(r'(^[a-zA-Z ]*$)').hasMatch(value)) {
          return 'PLease enter a valid Repeat name';
        }
      },
    );
  }
  Widget _buildtimem() {
    return TextFormField(
      keyboardType: TextInputType.datetime,
      decoration: InputDecoration(labelText: 'Time'),
      onSaved: (String value) {
        _rtimem = value;
      },
      validator: (String value) {
        if (value.isEmpty) {
          return 'Time cannot be empty';
        }
        int calories = int.tryParse(value);

        if (calories == null || calories <= 0) {
          return 'Cannot be 0 or anything apart from natural number';
        }

        if (calories < 0 && calories > 60) {
          return 'please enter mins time in 12H format';
        }
      },
    );
  }
  void jointime(){

  }

  Widget _buildrtime() {
    return TextFormField(

      keyboardType: TextInputType.datetime,
      decoration: InputDecoration(labelText: 'Time'),
      onSaved: (String value) {
        _rtime = value;
      },
      validator: (String value) {
        if (value.isEmpty) {
          return 'Time cannot be empty';
        }
        int calories = int.tryParse(value);

        if (calories == null || calories <= 0) {
          return 'Cannot be 0 or anything apart from natural number';
        }
        /* Pattern pattern =
            r'/^\(?(\d{3})\)?[- ]?(\d{3})[- ]?(\d{4})$/';
        RegExp regex = new RegExp(pattern);
        if (!regex.hasMatch(value))
          return 'Enter Valid Phone Number';
        else
          return null;
        if(!RegExp('/^(\+\d{1,3}[- ]?)?\d{10}$/').hasMatch(value)){
              return ;
        }*/
      },
    );
  }
  void _save() async {
    // moveToLastScreen();

    //note.date = DateFormat.yMMMd().format(DateTime.now());
  }

  */
  Widget _buildtimehr() {
    return TextFormField(
      keyboardType: TextInputType.datetime,
      decoration: InputDecoration(labelText: 'Duration', hintText: 'Mins'),
      onSaved: (String value) {
        _rtimehr = value;
      },
      validator: (String value) {
        if (value.isEmpty) {
          return 'Time cannot be empty';
        }
        int calories = int.tryParse(value);

        if (calories == null || calories <= 0) {
          return 'Cannot be 0 or anything apart from natural number';
        }

        if (calories < 0 && calories > 12) {
          return 'please enter time in 12H format';
        }
      },
    );
  }

  Widget _buildrlimit() {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(labelText: 'Limit'),
      onSaved: (String value) {
        _rlimit = value;
      },
      validator: (String value) {
        if (value.isEmpty) {
          return 'Room limit cannot be empty';
        }
        int calories = int.tryParse(value);

        if (calories == null || calories <= 0) {
          return 'Cannot be 0';
        }
        /*Pattern pattern =
            r'/^\(?(\d{3})\)?[- ]?(\d{3})[- ]?(\d{4})$/';
        RegExp regex = new RegExp(pattern);
        if (!regex.hasMatch(value))
          return 'Enter Valid Limit Number';
        else
          return null;*/
      },
    );
  }

  DateTime _dateTime = DateTime.now();

  Widget hourMinute12H() {
    return new TimePickerSpinner(
      is24HourMode: false,
      onTimeChange: (time) {
        setState(() {
          _dateTime = time;
        });
      },
    );
  }
}
