import '../../domain/enities/pharmacy.dart';
import '../../domain/repositories/pharmacy_repository.dart';
import '../local/local_storage_service.dart';

class PharmacyRepositoryImpl implements PharmacyRepository {
  final LocalStorageService localStorageService;
  final List<Map<String, String>> _pharmacyData = const [
    {
      'name': 'Reliable Pharmacy',
      'address': '456 Oak Avenue, Anytown',
      'iconUrl': 'https://via.placeholder.com/50/28a745/FFFFFF?Text=R',
      'description':
          'Your trusted partner for health and wellness. Open late evenings.',
    },
   {
      'name': 'Community Health Pharmacy',
      'address': '789 Pine Lane, Anytown',
      'iconUrl': 'https://via.placeholder.com/50/dc3545/FFFFFF?Text=C',
      'description':
          'Focusing on patient care and community well-being. Offers free health checks.',
    },
    {
      'name': 'Green Cross Pharmacy',
      'address': '101 Elm Street, Anytown',
      'iconUrl': 'https://via.placeholder.com/50/17a2b8/FFFFFF?Text=G',
      'description':
          'Providing quality medications and friendly service. Ask about our loyalty program.',
    },
    {
      'name': 'MedPlus Pharmacy',
      'address': '222 Maple Drive, Anytown',
      'iconUrl': 'https://via.placeholder.com/50/ffc107/000000?Text=M',
      'description':
          'A wide selection of over-the-counter and prescription drugs. Drive-thru available.',
    },
    {
      'name': 'CareFirst Pharmacy',
      'address': '333 Willow Court, Anytown',
      'iconUrl': 'https://via.placeholder.com/50/007bff/FFFFFF?Text=F',
      'description':
          'Committed to providing exceptional pharmaceutical care. Online refills available.',
    },
    {
      'name': 'Family Wellness Pharmacy',
      'address': '555 Birch Road, Anytown',
      'iconUrl': 'https://via.placeholder.com/50/6c757d/FFFFFF?Text=W',
      'description':
          'Supporting your family\'s health needs. Vaccinations and health advice provided.',
    },
    {
      'name': 'Swift Rx Pharmacy',
      'address': '666 Cedar Boulevard, Anytown',
      'iconUrl': 'https://via.placeholder.com/50/fd7e14/FFFFFF?Text=S',
      'description':
          'Fast and efficient prescription filling services. Serving the community for over 10 years.',
    },
    {
      'name': 'Apex Pharmacy',
      'address': '777 Spruce Avenue, Anytown',
      'iconUrl': 'https://via.placeholder.com/50/20c997/FFFFFF?Text=A',
      'description':
          'Leading in pharmaceutical innovation and patient care. Specialty medications available.',
    },
    {
      'name': 'Prime Health Pharmacy',
      'address': '888 Oak Street Ext, Anytown',
      'iconUrl': 'https://via.placeholder.com/50/343a40/FFFFFF?Text=P',
      'description':
          'Your primary source for health-related products and information. Health seminars offered.',
    },
    {
      'name': 'Vitality Pharmacy',
      'address': '999 Pinecrest Lane, Anytown',
      'iconUrl': 'https://via.placeholder.com/50/0d6efd/FFFFFF?Text=V',
      'description':
          'Dedicated to enhancing your vitality and well-being. Compounding services available.',
    },
  ];

  PharmacyRepositoryImpl({required this.localStorageService});

  @override
  Future<String> getZipCode() async {
    return await localStorageService.getZipCode();
  }

  @override
  Future<List<Pharmacy>> getPharmacies(String zipCode) async {
    return _pharmacyData
        .map((data) => Pharmacy(
              name: data['name']!,
              address: data['address']!,
              iconUrl: data['iconUrl']!,
              zipCode: zipCode == 'Zip code not found' ||
                      zipCode == 'Error reading zip code'
                  ? '12345'
                  : zipCode,
              description: data['description']!,
            ))
        .toList();
  }

  @override
  Future<void> setSelectedPharmacy(String pharmacyName) async {
    await localStorageService.setSelectedPharmacy(pharmacyName);
  }

  @override
  Future<String?> getSelectedPharmacy() async {
    return await localStorageService.getSelectedPharmacy();
  }
}