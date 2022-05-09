import 'dart:convert';
import 'package:http/http.dart' as http;
class NetworkHelper{
  final String url;
  
  NetworkHelper(this.url);
  Future<dynamic> getWeather()async{
    http.Response response = await http.get(Uri.parse(url));
    if(response.statusCode==200){
      String data= response.body;
      var cityName= jsonDecode(data)['name'];
      print(cityName);
      print(response.statusCode);
      return jsonDecode(data);
    }else{
      print('lllllllllllllllll${response.statusCode}');
      return null;
    }

  }
}
// String url='https://api.openweathermap.org/data/2.5/weather?lat=${position.latitude}&lon=${position.longitude}&appid=35ad01ef11206fefa2978ae5d0412c52';

