import 'package:flutter/material.dart';
import 'package:worldtime/services/world_time.dart';


class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(url: 'Africa/Lagos', location: 'Abuja', flag: 'nigeria.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Asia/Bangkok', location: 'Bangkok', flag: 'thai.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Bernlin', flag: 'germany.png'),
    WorldTime(url: 'Australia/Brisbane', location: 'Brisbane', flag: 'australia.png'),
    WorldTime(url: 'Australia/Broken_Hill', location: 'Broken Hill', flag: 'australia.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egyp.png'),
    WorldTime(url: 'Atlantic/Cape_Verde', location: 'Cape Verde', flag: 'cape.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'Australia/Hobart', location: 'Hobart', flag: 'australia.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
    WorldTime(url: 'Africa/Lagos', location: 'Lagos', flag: 'nigeria.png'),
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Madrid', location: 'Madrid', flag: 'spain.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobe', flag: 'kenya.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south.png'),
    WorldTime(url: 'Asia/Shanghai', location: 'Shanghai', flag: 'china.png'),
    WorldTime(url: 'Australia/Sydney', location: 'Sydney', flag: 'australia.png'),
  ];

  updateTime(index) async {

    WorldTime instance = locations[index];
    await instance.getTime();
//    navigate to home screen
  Navigator.pop(context, {
    'location' : instance.location,
    'flag' : instance.flag,
    'time' : instance.time,
    'isDayTime' : instance.isDayTime,
    'date' : instance.date,
  });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.blue[800],
        title: Text('Choose a Location'),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: locations.length,
          itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: (){
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            ),
          );
          }
      ),
    );
  }
}
