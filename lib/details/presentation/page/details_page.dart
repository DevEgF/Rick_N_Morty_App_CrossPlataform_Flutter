import 'package:flutter/material.dart';
import 'package:ricky_n_morty_aap/details/presentation/widgets/details_widgets.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({
    super.key,
    required this.characterId,
  });

  final String characterId;

  @override
  Widget build(BuildContext context) {
    return DetailsWidgets(
      characterId: characterId,
    );
  }
}
