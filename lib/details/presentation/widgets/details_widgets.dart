import 'package:flutter/material.dart';

class DetailsWidgets extends StatelessWidget {
  const DetailsWidgets({
    super.key,
    required this.characterId,
  });

  final String characterId;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(characterId),
    );
  }
}
