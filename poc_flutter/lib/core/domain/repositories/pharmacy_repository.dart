

import '../enities/pharmacy.dart';

abstract class PharmacyRepository {
  Future<String> getZipCode();
  Future<List<Pharmacy>> getPharmacies(String zipCode);
  Future<void> setSelectedPharmacy(String pharmacyName);
  Future<String?> getSelectedPharmacy(); // Optional: if you need to retrieve the selected pharmacy
}