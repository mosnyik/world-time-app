import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};


  @override
  Widget build(BuildContext context) {

//    receiving the data parsed from the loading page

    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    print(data);

//    set background image

    String bgImage = data['isDayTime'] ? 'day.jpg' : 'night.jpg';
//    Color bgColor = data['isDayTime'] ? Colors.orange[200] : Colors.indigo[650];

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/$bgImage'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 120.0, 0.0, 0.0),
          child: SafeArea(
              child: Column(
                children: <Widget>[
                  FlatButton.icon(
                    // button that redirect to the location

                      onPressed: () async {
                        dynamic result = await Navigator.pushNamed(context, '/location');
                        setState(() {
                          data = {
                            'time' : result['time'],
                            'location' : result['location'],
                            'flag' : result['flag'],
                            'isDayTime' : result['isDayTime'],
                            'date' : result['date'],
                          };
                        });
                      },
                      icon: Icon(
                          Icons.edit_location,
                        color: Colors.amberAccent,
                      ),
                      label: Text(
                          'Edit Location',
                        style: TextStyle(
                          color: Colors.amber,
                          fontSize: 25.0,
                        ),
                      ),
                  ),
                  SizedBox(height: 20.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                          data['location'],
                        style: TextStyle(
                          fontSize: 30.0,
                          letterSpacing: 2.0,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0,),
                  Center(
                    child: Text(
                      data['time'],
                      style: TextStyle(
                        fontSize: 66.0,
                        letterSpacing: 2.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0,),
                  Center(
                    child: Text(
                      data['date'],
                      style: TextStyle(
                        fontSize: 30.0,
                        letterSpacing: 2.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              )
          ),
        ),
      ),
    );
  }
}

