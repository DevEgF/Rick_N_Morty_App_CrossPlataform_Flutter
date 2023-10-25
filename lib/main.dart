import 'package:flutter/material.dart';
import 'package:ricky_n_morty_aap/home/page/home_page.dart';
import 'package:ricky_n_morty_aap/injection.dart';
import 'package:ricky_n_morty_aap/shared/theme/application_theme.dart';
import 'package:ricky_n_morty_aap/shared/theme/data/app_theme.dart';

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
      theme: ApplicationTheme.themes[AppTheme.dark]?.themeData,
      home: const HomePage(),
    );
  }
}
