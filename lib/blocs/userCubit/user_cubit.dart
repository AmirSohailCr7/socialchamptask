import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialchamptask/network/domain/entities/users/users_list_entity.dart';

class UserSearchState {
  final List<UserEntity> filteredUsers;

  UserSearchState({required this.filteredUsers});

  factory UserSearchState.initial() {
    return UserSearchState(filteredUsers: []);
  }
}

class UserSearchCubit extends Cubit<UserSearchState> {
  UserSearchCubit() : super(UserSearchState.initial());

  void updateFilteredUsers(List<UserEntity> users, String query) {
    if (query.isEmpty) {
      emit(UserSearchState(filteredUsers: users));
    } else {
      final filtered = users.where((user) {
        return user.name.toLowerCase().contains(query.toLowerCase()) ||
            user.phone.contains(query) ||
            user.id.toString().contains(query);
      }).toList();
      emit(UserSearchState(filteredUsers: filtered));
    }
  }
}
