import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialchamptask/blocs/userBloc/users_bloc.dart';
import 'package:socialchamptask/blocs/userBloc/users_event.dart';
import 'package:socialchamptask/blocs/userCubit/user_cubit.dart';
import 'package:socialchamptask/features/users/pages/user_list_page.dart';
import 'package:socialchamptask/network/data/repository/user_repository_impl.dart';
import 'package:socialchamptask/network/domain/usecases/users/users_usecases.dart';
import 'package:socialchamptask/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User Profiles',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: Routes.generateRoute,
      initialRoute: '/',
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => UserBloc(
              fetchUsersUseCase: FetchUserUseCases(UserRepositoryImpl()),
            )..add(FetchUsersEvent()), // Fetching users on app startup
          ),
          BlocProvider(
            create: (context) => UserSearchCubit(), // BlocProvider for UserSearchCubit to handle user search
          ),
        ],
        child: const UserListPage(),
      ),
    );
  }
}
