import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:localsend_app/config/theme.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/model/persistence/color_mode.dart';
import 'package:localsend_app/widget/drop_overlay.dart';
import 'package:localsend_app/widget/status_pill.dart';

Widget _wrap(Widget child, {required ThemeData theme}) {
  return MaterialApp(
    theme: theme,
    home: Scaffold(body: Center(child: child)),
  );
}

void main() {
  final theme = getTheme(
    ColorMode.localsend,
    Colors.teal,
    Brightness.light,
    null,
  );

  testWidgets('StatusPill spells out the online state', (tester) async {
    await tester.pumpWidget(
      _wrap(const StatusPill(online: true), theme: theme),
    );
    expect(find.text(t.general.online), findsOneWidget);
    expect(find.text(t.general.offline), findsNothing);
  });

  testWidgets('StatusPill spells out the offline state', (tester) async {
    await tester.pumpWidget(
      _wrap(const StatusPill(online: false), theme: theme),
    );
    expect(find.text(t.general.offline), findsOneWidget);
    expect(find.text(t.general.online), findsNothing);
  });

  testWidgets('DropOverlay shows the drop hint', (tester) async {
    await tester.pumpWidget(_wrap(const DropOverlay(), theme: theme));
    expect(find.text(t.sendTab.placeItems), findsOneWidget);
  });

  test('focused inputs are visibly different from enabled inputs', () {
    for (final brightness in Brightness.values) {
      final inputTheme = getTheme(
        ColorMode.localsend,
        Colors.teal,
        brightness,
        null,
      ).inputDecorationTheme;
      expect(inputTheme.focusedBorder, isNot(equals(inputTheme.enabledBorder)));
      expect(inputTheme.focusedBorder!.borderSide.width, 2);
    }
  });
}
