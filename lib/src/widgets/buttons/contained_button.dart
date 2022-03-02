import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:one_ui/src/effects/ink_ripple.dart';

class OneUIContainedButton extends ElevatedButton {
  const OneUIContainedButton({
    Key? key,
    required VoidCallback? onPressed,
    VoidCallback? onLongPress,
    ButtonStyle? style,
    FocusNode? focusNode,
    bool autofocus = false,
    Clip clipbehavior = Clip.none,
    required Widget? child,
    this.backgroundColor,
    this.splashFactory = OneUIInkRipple.splashFactory,
  }) : super(
          key: key,
          onPressed: onPressed,
          onLongPress: onLongPress,
          style: style,
          focusNode: focusNode,
          autofocus: autofocus,
          clipBehavior: clipbehavior,
          child: child,
        );

  final Color? backgroundColor;
  final InteractiveInkFeatureFactory? splashFactory;

  @override
  ButtonStyle defaultStyleOf(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;

    final EdgeInsetsGeometry scaledPadding = ButtonStyleButton.scaledPadding(
      const EdgeInsets.symmetric(horizontal: 16),
      const EdgeInsets.symmetric(horizontal: 8),
      const EdgeInsets.symmetric(horizontal: 4),
      MediaQuery.maybeOf(context)?.textScaleFactor ?? 1,
    );

    return TextButton.styleFrom(
      primary: colorScheme.onPrimary,
      onSurface: colorScheme.onSurface,
      backgroundColor: backgroundColor ?? colorScheme.primary,
      shadowColor: theme.shadowColor,
      elevation: 0,
      textStyle: theme.textTheme.button,
      padding: EdgeInsets.all(18),
      minimumSize: const Size(64, 36),
      maximumSize: Size.infinite,
      side: null,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(18),
        ),
      ),
      enabledMouseCursor: SystemMouseCursors.click,
      disabledMouseCursor: SystemMouseCursors.forbidden,
      visualDensity: theme.visualDensity,
      tapTargetSize: theme.materialTapTargetSize,
      animationDuration: kThemeChangeDuration,
      enableFeedback: false,
      alignment: Alignment.center,
      splashFactory: splashFactory,
    );
  }
}
