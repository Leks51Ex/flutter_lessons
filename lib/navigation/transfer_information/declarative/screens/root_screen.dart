// base_url/4/declarative_data_transfer/…/root_screen.dart 
import 'package:flutter/material.dart';
import 'package:flutter_stepik/navigation/transfer_information/declarative/router/my_route_delegate.dart';


class RootDataScreen extends StatelessWidget {
  const RootDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Передать декларативно данные на другой экран',
            ),
            const SizedBox(height: 16),
            ElevatedButton(
             onPressed: () {
                 (Router.of(context).routerDelegate as MyRouteDataDelegate)
                      .navigateTo(
                    '/home',
                    args: 'Переданные данные из RootScreen',
                  );
                },
            child: const Text('Передать строку')),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                (Router.of(context).routerDelegate as MyRouteDataDelegate)
                    .navigateTo(
                  '/profile/:10',
                );
              },
              child: const Text('Передать объект'),
            ),
          ],
        ),
      ),
    );
  }
}
