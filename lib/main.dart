import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ricky_n_morty_aap/details/presentation/page/details_page.dart';
import 'package:ricky_n_morty_aap/home/page/home_page.dart';
import 'package:ricky_n_morty_aap/injection.dart';
import 'package:ricky_n_morty_aap/shared/theme/application_theme.dart';
import 'package:ricky_n_morty_aap/shared/theme/data/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const RickyAndMortyApp());
}

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => const HomePage(),
      routes: <RouteBase>[
        GoRoute(
          name: 'details',
          path: 'details/:id',
          builder: (context, state) => DetailsPage(
            characterId: state.pathParameters['id'] ?? '1',
          ),
        )
      ],
    )
  ],
);

class RickyAndMortyApp extends StatelessWidget {
  const RickyAndMortyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'RickAndMortyApp',
      theme: ApplicationTheme.themes[AppTheme.light]?.themeData,
      routerConfig: _router,
    );
  }
}
