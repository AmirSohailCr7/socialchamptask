// User model
import 'package:socialchamptask/network/data/models/users/address_response.dart';
import 'package:socialchamptask/network/data/models/users/company_response.dart';
import 'package:socialchamptask/network/domain/entities/users/users_list_entity.dart';

class User {
  final int id;
  final String name;
  final String username;
  final String email;
  final Address address;  // User's address (Address model)
  final String phone;
  final String website;
  final Company company; // User's company (Company model)

  User({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.address,
    required this.phone,
    required this.website,
    required this.company,
  });

  // Factory method for creating a User instance from JSON
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      username: json['username'] ?? '',
      email: json['email'] ?? '',
      address: Address.fromJson(json['address'] ?? {}),
      phone: json['phone'] ?? '',
      website: json['website'] ?? '',
      company: Company.fromJson(json['company'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'username': username,
        'email': email,
        'address': address.toJson(),
        'phone': phone,
        'website': website,
        'company': company.toJson(),
      };

  // Convert User model to UserEntity
  UserEntity toEntity() {
    return UserEntity(
      id: id,
      name: name,
      username: username,
      email: email,
      address: address.toEntity(),
      phone: phone,
      website: website,
      company: company.toEntity(),
    );
  }
}