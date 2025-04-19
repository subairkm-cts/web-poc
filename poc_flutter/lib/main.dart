import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:poc_flutter/core/presentation/bloc/pharmacy_list_bloc.dart';
import 'package:poc_flutter/core/presentation/pharmacy_list_screen.dart';
import 'package:poc_flutter/di/injectable.dart';

void main() async {
  await init(); // Initialize GetIt
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocProvider(
        create: (context) => sl<PharmacyListBloc>(), // Get the BLoC instance from GetIt
        child: const PharmacyListScreen(),
      ),
    );
  }
}