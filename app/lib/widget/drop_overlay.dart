import 'package:flutter/material.dart';
import 'package:localsend_app/gen/strings.g.dart';

/// Shown while files are dragged over the window.
/// The translucent background keeps the current page visible behind the drop zone.
class DropOverlay extends StatelessWidget {
  const DropOverlay();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return ColoredBox(
      color: colorScheme.surface.withValues(alpha: 0.85),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: colorScheme.primaryContainer.withValues(alpha: 0.35),
            border: Border.all(color: colorScheme.primary, width: 2),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.file_download,
                    size: 96,
                    color: colorScheme.primary,
                  ),
                  const SizedBox(height: 24),
                  Text(
                    t.sendTab.placeItems,
                    style: theme.textTheme.titleLarge,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
