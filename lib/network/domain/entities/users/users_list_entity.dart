// User Entity
import 'package:socialchamptask/network/domain/entities/users/address_entity.dart';
import 'package:socialchamptask/network/domain/entities/users/company_entity.dart';

class UserEntity {
  final int id;
  final String name;
  final String username;
  final String email;
  final AddressEntity address; // Using AddressEntity as it represents a nested Address object
  final String phone;
  final String website;
  final CompanyEntity company; // Using CompanyEntity as it represents a nested company object

  UserEntity({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.address,
    required this.phone,
    required this.website,
    required this.company,
  });
}