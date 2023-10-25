import 'package:flutter/material.dart';

class DetailsWidgets extends StatelessWidget {
  const DetailsWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments;
    final id = (args as Map<String, Object?>)['id'] ?? 'Erro';
    return Center(
      child: Text(id.toString()),
    );
  }
}
