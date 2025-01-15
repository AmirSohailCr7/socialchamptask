import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialchamptask/blocs/userBloc/users_bloc.dart';
import 'package:socialchamptask/blocs/userBloc/users_event.dart';
import 'package:socialchamptask/blocs/userBloc/users_state.dart';
import 'package:socialchamptask/network/domain/entities/users/address_entity.dart';
import 'package:socialchamptask/network/domain/entities/users/company_entity.dart';
import 'package:socialchamptask/network/domain/entities/users/geo_entity.dart';
import 'package:socialchamptask/network/domain/entities/users/users_list_entity.dart';

class AddUserPage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController companyNameController = TextEditingController();
  final TextEditingController streetController = TextEditingController();
  final TextEditingController suiteController = TextEditingController();
  final TextEditingController zipcodeController = TextEditingController();
  final TextEditingController latController = TextEditingController();
  final TextEditingController lngController = TextEditingController();
  final TextEditingController catchPhraseController = TextEditingController();
  final TextEditingController bsController = TextEditingController();

  AddUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add User',
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: nameController,
                    decoration: const InputDecoration(labelText: 'Name'),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: phoneController,
                    decoration: const InputDecoration(labelText: 'Phone'),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: usernameController,
                    decoration: const InputDecoration(labelText: 'Username'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: emailController,
                    decoration: const InputDecoration(labelText: 'Email'),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: companyNameController,
                    decoration: const InputDecoration(labelText: 'Company Name'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: streetController,
                    decoration: const InputDecoration(labelText: 'Street'),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: suiteController,
                    decoration: const InputDecoration(labelText: 'Suite'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: cityController,
                    decoration: const InputDecoration(labelText: 'City'),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: zipcodeController,
                    decoration: const InputDecoration(labelText: 'Zipcode'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: latController,
                    decoration: const InputDecoration(labelText: 'Latitude'),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: lngController,
                    decoration: const InputDecoration(labelText: 'Longitude'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: catchPhraseController,
                    decoration: const InputDecoration(labelText: 'Catch Phrase'),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: bsController,
                    decoration: const InputDecoration(labelText: 'Business Slogan'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.yellow.shade700)),
              onPressed: () {
                final userList = context.read<UserBloc>().state as UserLoadedState;
                int userListLength = userList.users.length;

                final user = UserEntity(
                  id: userListLength + 1,
                  name: nameController.text,
                  email: emailController.text,
                  username: usernameController.text,
                  phone: phoneController.text,
                  website: 'www.google.com',
                  address: AddressEntity(
                    street: streetController.text,
                    suite: suiteController.text,
                    city: cityController.text,
                    zipcode: zipcodeController.text,
                    geo: GeoEntity(
                      lat: latController.text,
                      lng: lngController.text,
                    ),
                  ),
                  company: CompanyEntity(
                    name: companyNameController.text,
                    catchPhrase: catchPhraseController.text,
                    bs: bsController.text,
                  ),
                );

                context.read<UserBloc>().add(AddUserEvent(user));

                // pop the current AddUserPage
                Navigator.pop(context); 
              },
              child: const Text('Add User'),
            ),
          ],
        ),
      ),
    );
  }
}
