import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poc_flutter/core/domain/enities/pharmacy.dart';
import 'package:poc_flutter/core/domain/usecases/set_selected_pharmacies.dart';
import '../../domain/usecases/get_pharmacies.dart';
import '../../domain/usecases/get_zip_code.dart';

part 'pharmacy_list_event.dart';
part 'pharmacy_list_state.dart';

class PharmacyListBloc extends Bloc<PharmacyListEvent, PharmacyListState> {
  final GetPharmacies _getPharmacies;
  final SetSelectedPharmacies _setSelectedPharmacy;
  final GetZipCode _getZipCode;

  PharmacyListBloc({
    required GetPharmacies getPharmacies,
    required SetSelectedPharmacies setSelectedPharmacy,
    required GetZipCode getZipCode,
  })  : _getPharmacies = getPharmacies,
        _setSelectedPharmacy = setSelectedPharmacy,
        _getZipCode = getZipCode,
        super(PharmacyListState()) {
    on<LoadPharmacies>(_onLoadPharmacies);
    on<SetSelectedPharmacy>(_onSetSelectedPharmacy);
    on<UpdateZipCode>(_onUpdateZipCode);
    on<LoadZipCode>(_onLoadZipCode);
    add(LoadZipCode()); 
    add(LoadPharmacies()); 
  }

  Future<void> _onLoadZipCode(
      LoadZipCode event, Emitter<PharmacyListState> emit) async {
    final zipCodeResult = await _getZipCode.execute();
    emit(state.copyWith(zipCode: zipCodeResult));
  }

  Future<void> _onLoadPharmacies(
      LoadPharmacies event, Emitter<PharmacyListState> emit) async {
    emit(state.copyWith(status: PharmacyListStatus.loading));
    try {
      final pharmacies = await _getPharmacies.execute(state.zipCode);
      emit(state.copyWith(
          pharmacies: pharmacies, status: PharmacyListStatus.success));
    } catch (e) {
      emit(state.copyWith(
          status: PharmacyListStatus.failure,
          errorMessage: 'Failed to load pharmacies'));
    }
  }

  Future<void> _onSetSelectedPharmacy(
      SetSelectedPharmacy event, Emitter<PharmacyListState> emit) async {
    await _setSelectedPharmacy.execute(event.pharmacyName);
    emit(state.copyWith(selectedPharmacyName: event.pharmacyName));
  }

  void _onUpdateZipCode(
      UpdateZipCode event, Emitter<PharmacyListState> emit) {
    emit(state.copyWith(zipCode: event.zipCode));
    add(LoadPharmacies()); // Reload pharmacies when zip code changes
  }
}