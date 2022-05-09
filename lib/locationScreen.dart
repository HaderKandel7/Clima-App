import 'package:flutter/material.dart';
import 'package:clima/cityScreen.dart';
import 'package:clima/networking/weather.dart';

import 'constant.dart';

class LocationScreen extends StatefulWidget{
  final weatherModel;
  LocationScreen({@required this.weatherModel});

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  var temp;
  var cityName;
  var condition;
  var weatherMessage;
  var weatherIcon;
  var ww = WeatherModel();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () async {
                      var data =await ww.getLocationWeather();
                      updateUI(data);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                      color: Colors.white60,
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      var typedName = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return CityScreen();
                          },
                        ),
                      );
                      if(typedName!=null){
                        var weatherData = await ww.getCityWeather(typedName);
                        updateUI(weatherData);
                      }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                      color: Colors.white60,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temp°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      '$weatherIcon',
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Text(
                  '$weatherMessage in $cityName',
                  textAlign: TextAlign.left,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  updateUI(weatherData){
    setState(() {
      if(weatherData!=null){
        temp = weatherData['main']['temp'];
        temp=temp.toInt();
        condition = weatherData['weather'][0]['id'];
        cityName = weatherData['name'];
        weatherMessage = ww.getMessage(temp);
        weatherIcon = ww.getWeatherIcon(condition);
      }else{
        temp=0;
        weatherIcon='error';
        weatherMessage='unable to get weather';
        cityName='';
      }
    });
  }

  @override
  void initState() {
    super.initState();
    updateUI(widget.weatherModel);
  }

}