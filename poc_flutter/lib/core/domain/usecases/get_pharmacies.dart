import '../enities/pharmacy.dart';
import '../repositories/pharmacy_repository.dart';

class GetPharmacies {
  final PharmacyRepository repository;

  GetPharmacies(this.repository);

  Future<List<Pharmacy>> execute(String zipCode) async {
    return await repository.getPharmacies(zipCode);
  }
}