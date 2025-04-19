import 'dart:html' as html;

class LocalStorageService {
  Future<String> getZipCode() async {
    try {
      final cookies = html.window.document.cookie?.split(';');
      String? zip;
      if (cookies != null) {
        for (var cookie in cookies) {
          cookie = cookie.trim();
          if (cookie.startsWith('zip=')) {
            zip = cookie.substring('zip='.length);
            break;
          }
        }
      }
      return zip ?? 'Zip code not found';
    } catch (e) {
      print('LocalStorageService: Error reading zip code from cookie: $e');
      return 'Error reading zip code';
    }
  }

  Future<void> setSelectedPharmacy(String pharmacyName) async {
    final cookieName = 'myData';
    final expiryDate = DateTime.now().add(const Duration(days: 1));
    html.window.document.cookie =
        '$cookieName=${Uri.encodeComponent(pharmacyName)}; expires=${expiryDate.toUtc().toIso8601String()}; path=/';
    print('LocalStorageService: Selected pharmacy set to cookie: $pharmacyName');
  }

  Future<String?> getSelectedPharmacy() async {
    try {
      final cookies = html.window.document.cookie?.split(';');
      String? selectedPharmacy;
      if (cookies != null) {
        for (var cookie in cookies) {
          cookie = cookie.trim();
          if (cookie.startsWith('myData=')) {
            selectedPharmacy = Uri.decodeComponent(cookie.substring('myData='.length));
            break;
          }
        }
      }
      return selectedPharmacy;
    } catch (e) {
      print('LocalStorageService: Error reading selected pharmacy from cookie: $e');
      return null;
    }
  }
}