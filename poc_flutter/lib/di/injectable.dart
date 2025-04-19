

import 'package:get_it/get_it.dart';
import 'package:poc_flutter/core/data/local/local_storage_service.dart';
import 'package:poc_flutter/core/data/repositories/pharmacy_repository_impl.dart';
import 'package:poc_flutter/core/domain/repositories/pharmacy_repository.dart';
import 'package:poc_flutter/core/domain/usecases/get_pharmacies.dart';
import 'package:poc_flutter/core/domain/usecases/get_zip_code.dart';
import 'package:poc_flutter/core/domain/usecases/set_selected_pharmacies.dart';
import 'package:poc_flutter/core/presentation/bloc/pharmacy_list_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Core - Data
  sl.registerLazySingleton<LocalStorageService>(() => LocalStorageService());
  sl.registerLazySingleton<PharmacyRepository>(
    () => PharmacyRepositoryImpl(localStorageService: sl()),
  );

  // Core - Domain - Use Cases
  sl.registerLazySingleton(() => GetPharmacies(sl()));
  sl.registerLazySingleton(() => GetZipCode(sl()));
  sl.registerLazySingleton(() => SetSelectedPharmacies(sl()));

  // Presentation - Bloc
  sl.registerFactory(
    () => PharmacyListBloc(
      getPharmacies: sl(),
      setSelectedPharmacy: sl(),
      getZipCode: sl(),
    ),
  );
}