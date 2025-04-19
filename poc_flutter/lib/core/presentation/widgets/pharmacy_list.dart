import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/pharmacy_list_bloc.dart';
import 'pharmacy_card.dart';

class PharmacyList extends StatelessWidget {
  const PharmacyList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PharmacyListBloc, PharmacyListState>(
      builder: (context, state) {
        if (state.status == PharmacyListStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state.status == PharmacyListStatus.failure) {
          return Center(child: Text(state.errorMessage ?? 'Failed to load'));
        } else {
          return Expanded(
            child: ListView.builder(
              itemCount: state.pharmacies.length,
              itemBuilder: (context, index) {
                return PharmacyCard(pharmacy: state.pharmacies[index], zipCode: state.zipCode,);
              },
            ),
          );
        }
      },
    );}}