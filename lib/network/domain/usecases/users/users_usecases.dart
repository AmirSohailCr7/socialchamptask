import 'package:socialchamptask/network/domain/entities/users/users_list_entity.dart';  
import 'package:socialchamptask/network/domain/repository/users/users_repository.dart';  

/// Use case class responsible for fetching the list of users.
class FetchUserUseCases {
  final UsersRepository _usersRepository;  // Repository instance for fetching users

  FetchUserUseCases(this._usersRepository);

  Future<List<UserEntity>> fetchUserList() async {
    // Calls the repository's method to get the user list
    return await _usersRepository.getUserList();
  }
}
