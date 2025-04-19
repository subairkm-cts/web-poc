import '../repositories/pharmacy_repository.dart';

class SetSelectedPharmacies {
  final PharmacyRepository repository;

  SetSelectedPharmacies(this.repository);

  Future<void> execute(String pharmacyName) async {
    return await repository.setSelectedPharmacy(pharmacyName);
  }
}
