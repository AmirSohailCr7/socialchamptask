import 'package:socialchamptask/network/domain/entities/users/users_list_entity.dart';

abstract class UsersRepository{
  Future<List<UserEntity>> getUserList();
}