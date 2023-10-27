import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ricky_n_morty_aap/shared/widgets/default_try_again_widget.dart';

void main() {
  testWidgets('has only one try again message', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: DefaultTryAgainWidget(),
      ),
    );

    expect(find.text('Try again'), findsOneWidget);
  });
  testWidgets('has only one somenthing wrong message', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: DefaultTryAgainWidget(),
      ),
    );

    expect(find.text('Ops, somenthing wrong happpend'), findsOneWidget);
  });
}
