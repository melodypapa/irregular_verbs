import 'dart:async';

import 'package:flutter/material.dart';
import 'package:irregular_verbs/models/login.dart';

class EditFormPage extends StatefulWidget {
  @override
  _EditFormPageState createState() => _EditFormPageState();
}

class _EditFormPageState extends State<EditFormPage> {
  LoginData _loginData = LoginData();
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(50.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              validator: (String value) {
                if (value.length == 0) {
                  return "Please enter the username";
                }
                return null;
              },
              onSaved: (String value) {
                this._loginData.username = value;
              },
              decoration: InputDecoration(
                hintText: "Please enter the username.",
                labelText: "Username:",
              ),
            ),
            TextFormField(
              obscureText: true,
              validator: (String value) {
                if (value.length == 0) {
                  return "Please enter the password";
                }
                return null;
              },
              onSaved: (String value) {
                this._loginData.password = value;
              },
              decoration: InputDecoration(
                labelText: "Password:",
              ),
            ),
            RaisedButton(
              child: Text('Log In!'),
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  print(_formKey.currentState);
                  _formKey.currentState.save();
                  print("Username: ${_loginData.username}");
                  print("Password: ${_loginData.password}");
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CheckboxFormPage extends StatefulWidget {
  @override
  _CheckboxFormPageState createState() => _CheckboxFormPageState();
}

class _CheckboxFormPageState extends State<CheckboxFormPage> {
  GlobalKey<FormState> _key = GlobalKey<FormState>(debugLabel: "CheckboxForm");
  var _checkBoxValue = false;
  var _switchValue = false;
  var _sliderValue = .3;
  var _radioValue = 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50.0),
      child: Form(
        key: _key,
        child: Column(
          children: <Widget>[
            Checkbox(
              tristate: true,
              value: _checkBoxValue,
              onChanged: (bool value) {
                setState(() {
                  _checkBoxValue = value;
                  print("Checkbox State $_checkBoxValue");
                });
              },
            ),
            Switch(
              value: _switchValue,
              onChanged: null,
            ),
            Row(
              children: <Widget>[
                Radio(
                  value: 1,
                  groupValue: _radioValue,
                  onChanged: (int value) {
                    setState(() {
                      _radioValue = value;
                    });
                  },
                ),
                Text("Option 1"),
              ],
            ),
            Row(
              children: <Widget>[
                Radio(
                  value: 2,
                  groupValue: _radioValue,
                  onChanged: (int value) {
                    setState(() {
                      _radioValue = value;
                    });
                  },
                ),
                Text("Option 2"),
              ],
            ),
            Row(
              children: <Widget>[
                Slider(
                  value: _sliderValue,
                  min: 0,
                  max: 1,
                  onChanged: (double value) {
                    setState(() {
                      _sliderValue = value;
                      print("Slider Value: $_sliderValue");
                    });
                  },
                ),
                Text("Slider")
              ],
            )
          ],
        ),
      ),
    );
  }
}

class DateTimeAndDismissablePage extends StatelessWidget {
  Future<void> _selectDate(inContext) async {
    DateTime selectedDate = await showDatePicker(
      context: inContext,
      initialDate: DateTime.now(),
      firstDate: DateTime(2017),
      lastDate: DateTime(2021),
    );
    print(selectedDate);
  }

  Future<void> _selectTime(inContext) async {
    TimeOfDay selectedTime = await showTimePicker(
      context: inContext,
      initialTime: TimeOfDay.now(),
    );
    print(selectedTime);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(height: 50),
        RaisedButton(
          child: Text('Test DataPicker'),
          onPressed: () => _selectDate(context),
        ),
        RaisedButton(
          child: Text('Test TimePicker'),
          onPressed: () => _selectTime(context),
        ),
        Dismissible(
          key: GlobalKey(),
          onDismissed: (direction) {
            print("Goodbye!");
          },
          child: Container(
            color: Colors.yellow,
            width: 100,
            height: 50,
            child: Text("Swipe me"),
          ),
        )
      ],
    );
  }
}

class DialogPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future _showIt() async {
      switch (await showDialog(
          context: context,
          builder: (BuildContext context) {
            return SimpleDialog(
              title: Text("What's your favorite food?"),
              children: <Widget>[
                SimpleDialogOption(
                  onPressed: () {
                    Navigator.pop(context, "brocolli");
                  },
                  child: Text('Brocolli'),
                ),
                SimpleDialogOption(
                  onPressed: () {
                    Navigator.pop(context, "steak");
                  },
                  child: Text("Steak"),
                ),
              ],
            );
          })) {
        case "brocolli":
          print("Brocolli");
          break;
        case "steak":
          print("Steak");
          break;
      }
    }

    return Center(
      child: RaisedButton(
        child: Text('Show it'),
        onPressed: _showIt,
      ),
    );
  }
}
