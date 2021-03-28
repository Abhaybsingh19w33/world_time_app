// import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location; // location name on the ui
  String time; // the time in that location
  String flag; //  url to the asset flag item
  // http://worldtimeapi.org/api/timezone
  String url; //location url for apip endpoint
  bool isDaytime;

  WorldTime({this.location, this.flag, this.url});

// somepoint it is going to return the value
  Future<void> getTime() async {
    try {
      // it get the data about the response we get from the http
      Response response =
          await get('http://worldtimeapi.org/api/timezone/$url');

      Map data = jsonDecode(response.body);
      // print(data);

      // get properties from data
      String datetime = data['datetime'];
      String offsetMinutes = data['utc_offset'].substring(4);
      String offsetHours = data['utc_offset'].substring(1, 3);

      // create a datetime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(
          hours: int.parse(offsetHours), minutes: int.parse(offsetMinutes)));
      // print(now);

      // set the time property
      // time = now.toString();
      isDaytime = now.hour > 6 && now.hour < 19 ? true : false;
      time = DateFormat.jm().format(now);
      // print(now);
    } catch (e) {
      print('caught error : $e');
      time = 'could not get time property';
    }
  }
}
