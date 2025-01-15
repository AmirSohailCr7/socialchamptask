import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialchamptask/blocs/userBloc/users_bloc.dart';
import 'package:socialchamptask/blocs/userBloc/users_event.dart';
import 'package:socialchamptask/blocs/userBloc/users_state.dart';
import 'package:socialchamptask/blocs/userCubit/user_cubit.dart';
import 'package:socialchamptask/features/users/pages/add_user_page.dart';
import '../widgets/user_list_tile.dart';
import '../widgets/loading_indicator.dart';
import '../widgets/error_message.dart';

class UserListPage extends StatelessWidget {
  const UserListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Social Champ',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.orange, Colors.yellow],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: BlocBuilder<UserBloc, UserState>( // Building UI using Bloc state
        builder: (context, userBlocState) {
          if (userBlocState is UserLoadingState) {
            return const LoadingIndicator(); // Handling loading state
          } else if (userBlocState is UserErrorState) {
            return ErrorMessage(message: userBlocState.message); // Handling error state and showing error
          } else if (userBlocState is UserLoadedState) {
            return RefreshIndicator(
              onRefresh: () async {
                context.read<UserBloc>().add(FetchUsersEvent()); // Refreshing user data
              },
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: const InputDecoration(
                        labelText: 'Search by Name, Phone', // Search input label
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (query) {
                        context
                            .read<UserSearchCubit>()
                            .updateFilteredUsers(userBlocState.users, query); // Updating search results
                      },
                    ),
                  ),
                  Expanded(
                    child: BlocBuilder<UserSearchCubit, UserSearchState>( // Building search results
                      builder: (context, searchState) {
                        final users = searchState.filteredUsers.isNotEmpty
                            ? searchState.filteredUsers
                            : userBlocState.users; // Filtering or displaying all users

                        if (users.isEmpty) {
                          return const Center(child: Text('No users found.'));
                        }

                        return ListView.builder(
                          itemCount: users.length,
                          itemBuilder: (context, index) {
                            final user = users[index];
                            return UserCard( // Displaying individual user card
                              user: user,
                              onDelete: () {
                                context
                                    .read<UserBloc>()
                                    .add(DeleteUserEvent(user.id)); // Deleting user from the list
                              },
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          } else if (userBlocState is UserInitialState) {
            return Center(
              child: ElevatedButton(
                onPressed: () {
                  context.read<UserBloc>().add(FetchUsersEvent()); // trigger event to Fetch users list from api
                },
                child: const Text('Fetch Users'),
              ),
            );
          } else {
            return const Center(child: Text('No data available.'));
          }
        },
      ),
      floatingActionButton: SizedBox(
        width: 100, 
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddUserPage(), // Navigating to Add User page
              ),
            );
          },
          backgroundColor: Colors.yellow.shade800,
          tooltip: 'Add New User',
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.add,
                size: 28,
                color: Colors.white,
              ),
              Text(
                'Add User',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
