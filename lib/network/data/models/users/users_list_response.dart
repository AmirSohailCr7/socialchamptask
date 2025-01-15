import 'package:socialchamptask/network/data/models/users/user_model.dart';
import 'package:socialchamptask/network/domain/entities/users/users_list_entity.dart';

class UserList {
  final List<User> users;

  UserList({required this.users});

  factory UserList.fromJson(List<dynamic> jsonList) {
    return UserList(
      users: jsonList.map((json) => User.fromJson(json)).toList(),
    );
  }

  List<UserEntity> toEntity() {
    return users.map((user) => user.toEntity()).toList();
  }
}
