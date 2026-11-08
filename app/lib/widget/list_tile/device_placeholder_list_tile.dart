import 'package:flutter/material.dart';
import 'package:localsend_app/config/theme.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/provider/animation_provider.dart';
import 'package:localsend_app/util/device_type_ext.dart';
import 'package:localsend_app/widget/opacity_slideshow.dart';
import 'package:localsend_isolates/model/device.dart';
import 'package:refena_flutter/refena_flutter.dart';

/// Shown instead of the device list while no nearby device has been found.
class DevicePlaceholderListTile extends StatelessWidget {
  const DevicePlaceholderListTile();

  @override
  Widget build(BuildContext context) {
    final animations = context.ref.watch(animationProvider);
    final colorScheme = Theme.of(context).colorScheme;
    return Card(
      margin: EdgeInsets.zero,
      color: colorScheme.secondaryContainerIfDark,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          children: [
            Opacity(
              opacity: 0.6,
              child: OpacitySlideshow(
                durationMillis: 3000,
                running: animations,
                children: [
                  ...DeviceType.values.map((d) => Icon(d.icon, size: 46)),
                ],
              ),
            ),
            const SizedBox(width: 15),
            Expanded(child: Text(t.sendTab.help)),
          ],
        ),
      ),
    );
  }
}
