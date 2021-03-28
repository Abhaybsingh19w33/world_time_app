import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  // void getData() {
  //   // simulate netwrok request for a username
  //   // here duration object is passesd to set the timers
  //   // then the function is called after that time period
  //   Future.delayed(Duration(seconds: 3), () {
  //     print('getdata function');
  //   });
  //   // inspite of future delay the other code runs simultaneously
  //   print('Statement');

  //   // here the function 2 is started before the function 1 is ended
  //   // but in some senario we may need it to execute after the first one is completed executing
  //   Future.delayed(Duration(seconds: 2), () {
  //     print('getdata function 2');
  //   });
  // }

  // // examplpe of async and await
  // void getData() async {
  //   // now the code will wait untill this funtion is completed first
  //   await Future.delayed(Duration(seconds: 3), () {
  //     print('getdata function');
  //   });
  //   print('Statement');

  //   // here the function 2 is started before the function 1 is ended
  //   // but in some senario we may need it to execute after the first one is completed executing
  //   // this can be achieved by using async and await function
  //   Future.delayed(Duration(seconds: 2), () {
  //     print('getdata function 2');
  //   });
  // }

  // // examplpe of async and await
  // void getData() async {
  //   // now the code will wait untill this funtion is completed first
  //   // the data can be stored in the variable
  //   String username = await Future.delayed(Duration(seconds: 3), () {
  //     return 'getdata() function';
  //   });

  //   // here the function 2 is started before the function 1 is ended
  //   // but in some senario we may need it to execute after the first one is completed executing
  //   // this can be achieved by using async and await function
  //   String bio = await Future.delayed(Duration(seconds: 2), () {
  //     return 'bio';
  //   });
  //   print('$username - $bio');
  // }

  @override
  void initState() {
    super.initState();
    // getData();
  }

  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    // navigate to home screen
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        // here we are using the appbar so we don't need to use the safearea
        // appbar consists of the back button which will go back to the previous screen
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          title: Text('Choose a Location'),
          centerTitle: true,
          elevation: 0,
        ),
        body: ListView.builder(
            itemCount: locations.length,
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
                child: Card(
                  child: ListTile(
                    onTap: () {
                      updateTime(index);
                    },
                    title: Text(locations[index].location),
                    leading: CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/${locations[index].flag}'),
                    ),
                  ),
                ),
              );
            }));
  }
}
