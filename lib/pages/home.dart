import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    // receiving data from the loading Widget

    // here to stay updated we check if this data is empty then get data from loading widget
    // if it is not empty then get data from choose_location Widget
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    // print('data received $data');

    String bgimage = data['isDaytime'] ? 'day.png' : 'night.png';

    Color bgColor = data['isDaytime'] ? Colors.blue : Colors.indigo[700];
    return Scaffold(
        // here noe we are not using appbar so the text is appearing
        // at the top left corner of the Screen
        // so we are going to use the safe area to clear the top bar for notification etc,

        backgroundColor: bgColor,
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/$bgimage'),
              fit: BoxFit.cover,
            )),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
              child: Column(
                children: <Widget>[
                  TextButton.icon(
                    onPressed: () async {
                      // here pushing another screen on top of the another screen
                      // and get the data back
                      dynamic result =
                          await Navigator.pushNamed(context, '/location');
                      setState(() {
                        data = {
                          'time': result['time'],
                          'location': result['location'],
                          'isDaytime': result['isDaytime'],
                          'flag': result['flag']
                        };
                      });
                    },
                    icon: Icon(Icons.edit_location, color: Colors.grey[300]),
                    label: Text('Edit Location',
                        style: TextStyle(color: Colors.grey[300])),
                  ),
                  SizedBox(height: 20.0),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(data['location'],
                            style: TextStyle(
                              fontSize: 28.0,
                              letterSpacing: 2.0,
                              color: Colors.white,
                            ))
                      ]),
                  SizedBox(height: 20.0),
                  Text(data['time'],
                      style: TextStyle(
                        fontSize: 66.0,
                        color: Colors.white,
                      ))
                ],
              ),
            ),
          ),
        ));
  }
}
