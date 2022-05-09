import 'package:geolocator/geolocator.dart';

class Locate{
  double longitude;
  double latitude;
  var position;

  Future<void> determinePosition() async {
    print('A7A');
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      print('1خخخخخخخخخخخخخخخخخخخخخخخخخخخخخخخخخخخخخخخخخخخ');
      return Future.error('Location services are disabled.');

    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        print('2خخخخخخخخخخخخخخخخخخخخخخخخخخخخخخخخخخخخخخخخخخخ');
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      print('خخخخخخخخخخخخخخخخخخخخخخخخخخخخخخخخخخخخخخخخخخخ3');
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    if(position==null){print('احااااااااااااااااااااااااااااااااااااا');}
    longitude= position.longitude;
    latitude=position.latitude;

    print(longitude);
    print(latitude);
    print('-------------------------------------------hhhhhhhhhhhhhhhhhhhhhhh----------------------------------------------------------');

  }

}