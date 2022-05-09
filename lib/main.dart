import 'package:clima/networking/locate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima/locationScreen.dart';
import 'package:clima/networking/weather.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home:Clima() ,
    );
  }
}


class Clima extends StatefulWidget {
  @override
  _ClimaState createState() => _ClimaState();
}

class _ClimaState extends State<Clima> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // get();
    getLocationData();
  }
  // void get()async{
  //   var l = Locate();
  //   await l.determinePosition();
  //   print('ggggggggggggggggg${l.latitude}mmmmmmmmmm${l.longitude}');
  // }
  getLocationData() async {
    var weather =WeatherModel();
    var weatherData =await weather.getLocationWeather();
    Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context){
      return LocationScreen(weatherModel: weatherData,);
    }) , (route) => false);

  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.grey,
        child: Center(
          child: SpinKitDualRing(
            color: Colors.deepPurple,
            size: 100.0,
          ),
        ),
      ),
    );
  }
}

