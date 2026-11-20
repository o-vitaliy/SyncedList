import 'dart:ui' show lerpDouble;

import 'package:material_ui/material_ui.dart';

/// Lifts the dragged row with a shadow while it's being reordered.
Widget liftedProxyDecorator(
  Widget child,
  int index,
  Animation<double> animation,
) {
  return AnimatedBuilder(
    animation: animation,
    builder: (context, child) {
      final t = Curves.easeInOut.transform(animation.value);
      return Material(
        elevation: lerpDouble(0, 6, t)!,
        color: Colors.transparent,
        shadowColor: Theme.of(context).colorScheme.shadow,
        borderRadius: BorderRadius.circular(16),
        child: child,
      );
    },
    child: child,
  );
}

/// Drag handle; dragging it starts reordering right away (no long press).
class DragHandle extends StatelessWidget {
  final int index;

  const DragHandle({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return ReorderableDragStartListener(
      index: index,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Icon(
          Icons.drag_indicator,
          color: Theme.of(context).colorScheme.outline,
        ),
      ),
    );
  }
}
