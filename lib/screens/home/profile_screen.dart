import 'package:flutter/material.dart';

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'John Doe',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const Text('johndoe@gmail.com'),
            ],
          ),
        ),
      ],
    );
  }
}