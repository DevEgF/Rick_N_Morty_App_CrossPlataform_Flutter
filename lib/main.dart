import 'package:flutter/material.dart';
import 'package:ricky_n_morty_aap/home/page/home_page.dart';
import 'package:ricky_n_morty_aap/injection.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const RickyAndMortyApp());
}

class RickyAndMortyApp extends StatelessWidget {
  const RickyAndMortyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RickAndMortyApp',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
