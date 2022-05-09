import 'package:clima/networking/location.dart';
import 'package:clima/networking/networkHelper.dart';


const weatherUrl= 'https://api.openweathermap.org/data/2.5/weather?';
const apiKey ='35ad01ef11206fefa2978ae5d0412c52';
const cityUrl= 'https://api.openweathermap.org/data/2.5/weather?';
class WeatherModel{

 Future<dynamic> getLocationWeather() async {
   var location = Location();
   await location.determinePosition();
   var position= location.position;
   var long = position.longitude;
   var lat = location.latitude;
   print(long);
   print(lat);
   var weather = NetworkHelper('${weatherUrl}lat=${lat}&lon=${long}&appid=$apiKey&units=metric');
   var weatherData =await weather.getWeather();
   return weatherData;
 }
 Future<dynamic> getCityWeather(cityName) async{
   var weather = NetworkHelper('${cityUrl}q=${cityName}&appid=${apiKey}&units=metric');
   var weatherData = await weather.getWeather();
   return weatherData;
 }

 String getWeatherIcon(int condition) {
   if (condition < 300) {
     return '🌩';
   } else if (condition < 400) {
     return '🌧';
   } else if (condition < 600) {
     return '☔️';
   } else if (condition < 700) {
     return '☃️';
   } else if (condition < 800) {
     return '🌫';
   } else if (condition == 800) {
     return '☀️';
   } else if (condition <= 804) {
     return '☁️';
   } else {
     return '🤷‍';
   }
 }

 String getMessage(int temp) {
   if (temp > 25) {
     return 'It\'s 🍦 time';
   } else if (temp > 20) {
     return 'Time for shorts and 👕';
   } else if (temp < 10) {
     return 'You\'ll need 🧣 and 🧤';
   } else {
     return 'Bring a 🧥 just in case';
   }
 }

}
// String url='https://api.openweathermap.org/data/2.5/weather?lat=${position.latitude}&lon=${position.longitude}&appid=35ad01ef11206fefa2978ae5d0412c52';
