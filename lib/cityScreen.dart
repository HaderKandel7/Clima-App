import 'package:flutter/material.dart';

import 'constant.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  var cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/city_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              IconButton(
                  alignment: Alignment.topLeft,
                  icon: Icon(
                    Icons.arrow_back_ios,
                    size: 50,
                    color: Colors.white60,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  onChanged: (value){
                    cityName = value;
                  },
                  decoration: InputDecoration(
                      hintText: 'Enter City Name',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                      fillColor: Colors.white70,
                      filled: true,
                      icon: Icon(
                        Icons.location_city,
                        color: Colors.white60,
                        size: 30,
                      )),
                ),
              ),
              SizedBox(height: 10,),
              TextButton(
                child: Text('Get Weather',
                style: kButtonTextStyle,
                ),
                onPressed: (){
                  Navigator.pop(context,cityName);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
