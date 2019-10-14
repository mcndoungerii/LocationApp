const GOOGLE_API_KEY = 'AIzaSyBg9yn5JtQgKRFbg6FCTy4ewbF24kRuAY';

class LocationHelper {
  static String generateLocationImagePreview(
      {double latitude, double longitude}) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=&$latitude,$longitude&zoom=13&size=600x300&maptype=roadmap&markers=color:red%7Clabel:C%7C$latitude,$longitude&key=$GOOGLE_API_KEY';
  }
}
