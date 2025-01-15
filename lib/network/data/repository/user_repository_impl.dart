import 'package:flutter/material.dart';  
import 'package:socialchamptask/network/core/network_api_method_impl.dart';  
import 'package:socialchamptask/network/core/utils/constants/api_headers.dart'; 
import 'package:socialchamptask/network/core/utils/constants/app_urls.dart';  
import 'package:socialchamptask/network/data/models/users/users_list_response.dart';  
import 'package:socialchamptask/network/domain/entities/users/users_list_entity.dart';  
import 'package:socialchamptask/network/domain/repository/users/users_repository.dart';  

/// Implementation of the UsersRepository interface.
/// This class handles fetching the list of users from the API.
class UserRepositoryImpl implements UsersRepository {
  final _apiServices = NetworkApiMethodsImpl<List<dynamic>>();  // Instance of API services for network calls

  /// Returns a list of [UserEntity] objects.
  @override
  Future<List<UserEntity>> getUserList() async {
    const url = UserUrl.getUsers; 
    final customHeaders = Map<String, String>.from(Header.headers); 

    try {
      final response = await _apiServices.getApi(url, customHeaders);  
      debugPrint("API Response: $response"); 
      final userList = UserList.fromJson(response);  // Parses API response to UserList model
      final entities = userList.toEntity();  // Converts UserList model to UserEntity list
      return entities;
    } catch (e) {
      debugPrint("Error in getUserList: $e");  
      throw Exception('Failed to fetch user list');  
    }
  }
}
