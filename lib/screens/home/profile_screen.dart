import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nusacodes/blocs/auth/authentication_cubit.dart';
import 'package:flutter_nusacodes/blocs/auth/authentication_state.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildHeaderProfile(context),
          const SizedBox(height: 32),
          ListTile(
            leading: const Icon(Icons.lock),
            title: const Text('Ganti Password'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderProfile(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          child: Text('N'),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: BlocBuilder<AuthenticationCubit, AuthenticationState>(
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    state.user?.name ?? '',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(state.user?.email ?? ''),
                ],
              );
            }
          ),
        ),
      ],
    );
  }
}