import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialchamptask/blocs/userBloc/users_event.dart';
import 'package:socialchamptask/blocs/userBloc/users_state.dart';
import 'package:socialchamptask/network/domain/usecases/users/users_usecases.dart';
import 'package:socialchamptask/network/domain/entities/users/users_list_entity.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final FetchUserUseCases fetchUsersUseCase;

  UserBloc({required this.fetchUsersUseCase}) : super(UserInitialState()) {
    // Handle fetching users
    on<FetchUsersEvent>((event, emit) async {
      emit(UserLoadingState());  // Emits loading state before fetching data
      try {
        final users = await fetchUsersUseCase.fetchUserList();
        emit(UserLoadedState(users));  // Emits loaded state with the fetched user list
      } catch (e) {
        emit(UserErrorState(e.toString())); // Emits error state if fetching fails
      }
    });

    // Handle adding a new user
   on<AddUserEvent>((event, emit) {
      if (state is UserLoadedState) {
        final currentState = state as UserLoadedState;
        final updatedUsers = List<UserEntity>.from(currentState.users)..add(event.user); // Add new user to the list
        emit(UserLoadedState(updatedUsers)); // Emit updated state
      }
    });

    on<DeleteUserEvent>((event, emit) {
  if (state is UserLoadedState) {
    final currentState = state as UserLoadedState;
    debugPrint("Deleting user with ID: ${event.userId}");
    final updatedUsers = currentState.users
        .where((user) => user.id != event.userId)  // Filters out the user to be deleted
        .toList(); // Creates a new list excluding the user with given ID
    emit(UserLoadedState(updatedUsers)); // Emits new state with updated user list
  }
});

  }
}
