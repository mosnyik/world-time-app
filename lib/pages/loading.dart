import 'package:flutter/material.dart';
import 'package:worldtime/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  // the first screen that appears as you wait for the time to load


void setupWorldTime() async {

  // await function that displays the WorldTime instance

  WorldTime instance = WorldTime(location: 'Abuja', flag: 'nigeria.png', url: 'Africa/Lagos' );
  await instance.getTime();
  Navigator.pushReplacementNamed(context, '/home', arguments: {
    'location' : instance.location,
    'flag' : instance.flag,
    'time' : instance.time,
    'isDayTime' : instance.isDayTime,
    'date' : instance.date,
  });

}

  @override
  void initState() {

  // the first screen that displays when the loading.. is over

    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
          child: SpinKitFadingCircle (
            color: Colors.white,
            size: 100.0,
          ),
      ),
    );
  }
}
