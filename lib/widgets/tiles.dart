import 'package:flutter/material.dart';

class LabeledCheckbox extends StatelessWidget {
  const LabeledCheckbox({
    @required this.label,
    @required this.value,
    @required this.onChanged,
    this.padding,
    this.subLabel,
    this.extended = false,
  });

  final String label;
  final String subLabel;
  final EdgeInsets padding;
  final bool value;
  final bool extended;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    final WidgetBuilder builder = (context) {
      return Checkbox(
        value: value,
        onChanged: onChanged,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      );
    };

    return _LabeledWidget<bool>(
        label: label,
        subLabel: subLabel,
        value: value,
        trialing: true,
        onChanged: (v) => onChanged(!value),
        builder: builder,
        extended: extended,
        padding: padding);
  }
}

class LabeledRadio<T> extends StatelessWidget {
  final String label;
  final EdgeInsets padding;
  final T value;
  final T groupValue;
  final ValueChanged<T> onChanged;
  final bool extended;

  LabeledRadio({
    @required this.label,
    @required this.value,
    @required this.groupValue,
    @required this.onChanged,
    this.padding,
    this.extended = false,
  });

  @override
  Widget build(BuildContext context) {
    final WidgetBuilder builder = (context) {
      return Radio(
        value: value,
        groupValue: groupValue,
        onChanged: onChanged,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      );
    };
    return _LabeledWidget<T>(
        label: label,
        value: value,
        onChanged: onChanged,
        builder: builder,
        padding: padding,
        extended: extended);
  }
}

class LabeledSwitch extends StatelessWidget {
  const LabeledSwitch({
    @required this.label,
    @required this.value,
    @required this.onChanged,
    this.padding,
  });

  final String label;
  final EdgeInsets padding;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    final WidgetBuilder builder = (context) {
      return Switch(
        value: value,
        onChanged: (bool newValue) {
          onChanged(!value);
        },
      );
    };

    return _LabeledWidget<bool>(
        label: label,
        value: value,
        onChanged: (v) => onChanged(!value),
        builder: builder,
        trialing: true,
        padding: padding);
  }
}

class _LabeledWidget<T> extends StatelessWidget {
  const _LabeledWidget({
    @required this.label,
    this.subLabel,
    @required this.value,
    @required this.onChanged,
    @required this.builder,
    this.trialing = false,
    this.padding,
    this.extended = false,
  });

  final String label;
  final String subLabel;
  final bool trialing;
  final EdgeInsets padding;
  final T value;
  final ValueChanged<T> onChanged;

  final WidgetBuilder builder;
  final bool extended;

  @override
  Widget build(BuildContext context) {
    List<Widget> children = trialing
        ? [getTitle(context, label, subLabel), builder(context)]
        : [builder(context), getTitle(context, label, subLabel)];

    return InkWell(
      onTap: () {
        onChanged(value);
      },
      child: Padding(
        padding: padding ??
            (trialing ? EdgeInsets.only(left: 16) : const EdgeInsets.all(0)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: children,
        ),
      ),
    );
  }

  Widget getTitle(BuildContext context, String title, String subtitle) {
    final theme = Theme.of(context);
    Widget widget;
    if (subtitle == null) {
      widget = Text(label);
    } else {
      widget = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(label),
            Text(subtitle,
                style: theme.textTheme.bodyText2
                    .copyWith(color: theme.textTheme.caption.color))
          ]);
    }
    if (extended) {
      return Expanded(child: widget);
    } else {
      return widget;
    }
  }
}
