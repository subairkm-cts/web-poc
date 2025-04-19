import '../repositories/pharmacy_repository.dart';

class GetZipCode {
  final PharmacyRepository repository;

  GetZipCode(this.repository);

  Future<String> execute() async {
    return await repository.getZipCode();
  }
}