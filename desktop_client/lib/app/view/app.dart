import 'package:app_ui/app_ui.dart';
import 'package:backend_repository/backend_repository.dart';
import 'package:desktop_client/game_screen/game_screen.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        home: const GameScreenPage(),
      ),
    );
  }
}

class CardsGallery extends StatefulWidget {
  const CardsGallery({super.key});

  @override
  State<CardsGallery> createState() => _CardsGalleryState();
}

class _CardsGalleryState extends State<CardsGallery> {
  bool real = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
        ),
        itemCount: 20,
        itemBuilder: (context, index) {
          final art = Art(
            type: ArtType.values[index % ArtType.values.length],
            id: (index % 4) + 1,
            isReal: real,
          );
          return ArtCard(
            art: art,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            real = !real;
          });
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
