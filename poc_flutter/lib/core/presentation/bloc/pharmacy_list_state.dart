part of 'pharmacy_list_bloc.dart';


enum PharmacyListStatus { initial, loading, success, failure }

class PharmacyListState {
  final PharmacyListStatus status;
  final String zipCode;
  final List<Pharmacy> pharmacies;
  final String selectedPharmacyName;
  final String? errorMessage;

  PharmacyListState({
    this.status = PharmacyListStatus.initial,
    this.zipCode = 'Loading...',
    this.pharmacies = const [],
    this.selectedPharmacyName = '',
    this.errorMessage,
  });

  PharmacyListState copyWith({
    PharmacyListStatus? status,
    String? zipCode,
    List<Pharmacy>? pharmacies,
    String? selectedPharmacyName,
    String? errorMessage,
  }) {
    return PharmacyListState(
      status: status ?? this.status,
      zipCode: zipCode ?? this.zipCode,
      pharmacies: pharmacies ?? this.pharmacies,
      selectedPharmacyName:
          selectedPharmacyName ?? this.selectedPharmacyName,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}