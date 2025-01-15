import 'package:equatable/equatable.dart';
import 'package:socialchamptask/network/domain/entities/users/users_list_entity.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object?> get props => [];
}

class FetchUsersEvent extends UserEvent {}

class AddUserEvent extends UserEvent {
  final UserEntity user;

  const AddUserEvent(this.user);

  @override
  List<Object?> get props => [user];
}

class DeleteUserEvent extends UserEvent {
  final int userId;

  const DeleteUserEvent(this.userId);

  @override
  List<Object?> get props => [userId];
}
