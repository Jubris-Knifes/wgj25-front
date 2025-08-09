import 'package:backend_repository/backend_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_client/join_game/view/join_game_page.dart';

class App extends StatelessWidget {
  const App({
    required this.backendRepository,
    super.key,
  });

  final BackendRepository backendRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: backendRepository,
      child: MaterialApp(
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          ),
          useMaterial3: true,
        ),
        home: const JoinGamePage(),
      ),
    );
  }
}
