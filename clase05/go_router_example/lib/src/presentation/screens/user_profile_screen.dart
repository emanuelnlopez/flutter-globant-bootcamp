import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_example/src/presentation/presentation.dart';
import 'package:provider/provider.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('User Profile')),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const ListTile(
                leading: Icon(Icons.person),
                subtitle: Text('RandomUser'),
                title: Text('Username'),
                trailing: Icon(Icons.chevron_right),
              ),
              const ListTile(
                leading: Icon(Icons.alternate_email),
                subtitle: Text('randomuser@mail.com'),
                title: Text('Email'),
                trailing: Icon(Icons.chevron_right),
              ),
              ListTile(
                leading: const Icon(Icons.exit_to_app),
                onTap: () => context.pushNamed('settings'),
                subtitle: const Text('Theme, Notifications, etc'),
                title: const Text('Settings'),
                trailing: const Icon(Icons.chevron_right),
              ),
              ListTile(
                leading: const Icon(Icons.info_outline),
                onTap: () => context.pushNamed(
                  'test',
                  pathParameters: {
                    'id': 'abc',
                    'date': '2024-09-23',
                  },
                  queryParameters: {
                    'search': 'go_router example',
                    'order': 'asc',
                  },
                ),
                subtitle: const Text('path and query parameters'),
                title: const Text('GoRouter Test page'),
                trailing: const Icon(Icons.chevron_right),
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                onTap: () async {
                  await context.read<UserController>().logOut();
                  if (context.mounted) {
                    context.goNamed('login');
                  }
                },
                subtitle: const Text('End user session'),
                title: const Text('Log Out'),
                trailing: const Icon(Icons.chevron_right),
              ),
            ],
          ),
        ),
      );
}
