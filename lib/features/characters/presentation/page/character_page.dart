import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:ricky_n_morty_aap/characters/presentation/bloc/character_bloc.dart';
import 'package:ricky_n_morty_aap/characters/presentation/widgets/character_widget.dart';

class CharacterPage extends StatelessWidget {
  const CharacterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.I.get<CharacterBloc>()..add(CharacterRequestEvent()),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Characters',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blueGrey,
        ),
        body: const CharacterWidget(),
      ),
    );
  }
}
