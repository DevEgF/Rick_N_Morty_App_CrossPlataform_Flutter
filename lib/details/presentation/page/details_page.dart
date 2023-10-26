import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:ricky_n_morty_aap/details/presentation/bloc/character_details_bloc.dart';
import 'package:ricky_n_morty_aap/details/presentation/widgets/details_widgets.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({
    super.key,
    required this.characterId,
  });

  final String characterId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.I.get<CharacterDetailsBloc>()
        ..add(CharacterDetailsRequestEvent(characterId)),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
        ),
        body: DetailsWidgets(
          characterId: characterId,
        ),
      ),
    );
  }
}
