part of 'pharmacy_list_bloc.dart';

abstract class PharmacyListEvent {}

class LoadPharmacies extends PharmacyListEvent {}

class SetSelectedPharmacy extends PharmacyListEvent {
  final String pharmacyName;

  SetSelectedPharmacy(this.pharmacyName);
}

class UpdateZipCode extends PharmacyListEvent {
  final String zipCode;

  UpdateZipCode(this.zipCode);
}

class LoadZipCode extends PharmacyListEvent {}