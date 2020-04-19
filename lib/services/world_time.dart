import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

// WorldTime class
class WorldTime {

  // set parameters

  String location; // the location name for the UI
  String time; // the time at that location
  String flag; // url to an asset flag icon
  String url; // location url for the api endpoint
  bool isDayTime;// true or false whether day or night
  String date; // day and full date in that location

  // WorldTime constructor

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {

    try {
      //    make an api request
      Response response = await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);
//      print(data);

//  get properties of data
      String dateTime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);
//      print(dateTime);
//      print(offset);

//  create a datetime object
      DateTime now = DateTime.parse(dateTime);

      now = now.add(Duration(hours: int.parse(offset)));
      //set the time property
      date = DateFormat.yMMMMEEEEd().format(now);
      time = DateFormat.jm().format(now);
      isDayTime = now.hour > 6 && now.hour < 19 ? true : false;

    }
    catch (e) {
      print('Caught an error: $e');
      time = 'Could not get time data at the moment';
    }

  }

}