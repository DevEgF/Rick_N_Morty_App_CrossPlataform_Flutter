// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class DefaultTryAgainWidget extends StatelessWidget {
  const DefaultTryAgainWidget({
    Key? key,
    this.onPressed,
  }) : super(key: key);

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Ops, somenthing wrong happpend',
              style: Theme.of(context).textTheme.labelSmall,
            ),
            const SizedBox(
              height: 8,
            ),
            TextButton(
              onPressed: onPressed,
              child: const Text('Try again'),
            )
          ],
        ),
      );
}
