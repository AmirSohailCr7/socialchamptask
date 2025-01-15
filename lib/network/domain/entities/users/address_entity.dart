// Address Entity
import 'package:socialchamptask/network/domain/entities/users/geo_entity.dart';

class AddressEntity {
  final String street;
  final String suite;
  final String city;
  final String zipcode;
  final GeoEntity geo; // Using GeoEntity as it represents a nested geographical location object

  AddressEntity({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geo,
  });
}