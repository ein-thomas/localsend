import 'package:flutter/material.dart';
import 'package:localsend_app/gen/strings.g.dart';

/// Shows whether this device can currently receive files.
/// The state is always spelled out, so it does not rely on the dot color alone.
class StatusPill extends StatelessWidget {
  final bool online;

  const StatusPill({required this.online});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: colorScheme.secondaryContainer,
        borderRadius: BorderRadius.circular(9999),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                color: online ? colorScheme.primary : colorScheme.error,
                shape: BoxShape.circle,
              ),
              child: const SizedBox.square(dimension: 10),
            ),
            const SizedBox(width: 8),
            Text(
              online ? t.general.online : t.general.offline,
              style: TextStyle(
                color: colorScheme.onSecondaryContainer,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
