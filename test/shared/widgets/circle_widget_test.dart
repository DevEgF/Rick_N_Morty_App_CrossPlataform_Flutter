import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ricky_n_morty_aap/shared/widgets/circle_widget.dart';

void main() {
  group('circle widget default test', () {
    testWidgets('contains only a container', (tester) async {
      await tester.pumpWidget(const CircleWidget(status: ''));

      expect(find.byType(Container), findsOneWidget);
      expect(find.byType(Text), findsNothing);
    });

    testWidgets('contains a widget with a key', (tester) async {
      const textKey = Key('testKey');

      await tester.pumpWidget(
        const MaterialApp(
          home: CircleWidget(status: '', key: textKey),
        ),
      );

      expect(find.byKey(textKey), findsOneWidget);
    });
  });

  group('circle widget decoration color test', () {
    testWidgets('contains a red decoration circle', (tester) async {
      await tester.pumpWidget(const CircleWidget(status: 'dead'));
      final container =
          find.byType(Container).evaluate().single.widget as Container;

      expect((container.decoration as BoxDecoration).color, Colors.red);
    });

    testWidgets('contains a green decoration circle', (tester) async {
      await tester.pumpWidget(const CircleWidget(status: 'alive'));
      final container =
          find.byType(Container).evaluate().single.widget as Container;

      expect((container.decoration as BoxDecoration).color, Colors.green);
    });

    testWidgets('contains a grey decoration circle', (tester) async {
      await tester.pumpWidget(const CircleWidget(status: 'unknow'));
      final container =
          find.byType(Container).evaluate().single.widget as Container;

      expect((container.decoration as BoxDecoration).color, Colors.grey);
    });
  });
}
