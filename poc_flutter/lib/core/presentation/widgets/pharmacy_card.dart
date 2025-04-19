import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poc_flutter/core/domain/enities/pharmacy.dart';
import '../bloc/pharmacy_list_bloc.dart';

class PharmacyCard extends StatelessWidget {
  final Pharmacy pharmacy;
  final String zipCode;

  const PharmacyCard({
    super.key,
    required this.pharmacy,
    required this.zipCode,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      elevation: 1.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: InkWell(
        onTap: () {
          context.read<PharmacyListBloc>().add(
            SetSelectedPharmacy(pharmacy.name),
          );
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Selected Pharmacy: ${pharmacy.name}'),
              duration: const Duration(seconds: 2), // Adjust duration as needed
            ),
          );
        },
        borderRadius: BorderRadius.circular(10.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 28.0,
                backgroundColor: Colors.grey[100],
                child: Icon(
                  Icons.local_pharmacy_outlined,
                  size: 36.0,
                  color: Colors.black45,
                ),
              ),
              const SizedBox(width: 16.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      pharmacy.name,
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 6.0),
                    Text(
                      pharmacy.address,
                      style: const TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 6.0),
                    Row(
                      children: [
                        const Text(
                          'Zip code : ',
                          style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          zipCode,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      pharmacy.description,
                      style: const TextStyle(
                        fontSize: 15.0,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
