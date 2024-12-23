import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:songjog/constants/colors.dart';

class LocalizationSwitch extends StatefulWidget {
  final ValueChanged<bool> onChanged;
  final bool isEnglishSelected;

  const LocalizationSwitch({
    super.key,
    required this.onChanged,
    required this.isEnglishSelected,
  });

  @override
  _LocalizationSwitchState createState() => _LocalizationSwitchState();
}

class _LocalizationSwitchState extends State<LocalizationSwitch> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'বাং',
          style: TextStyle(
            color: !widget.isEnglishSelected
                ? AppColors.primaryColor
                : Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),
        CupertinoSwitch(
          activeColor: AppColors.primaryColor,
          value: widget.isEnglishSelected,
          // onChanged: widget.onChanged,
          onChanged: (value) {
            // Only call onChanged if the value is different
            if (value != widget.isEnglishSelected) {
              widget.onChanged(value);
            }
          },
        ),
        Text(
          'EN',
          style: TextStyle(
            color:
                widget.isEnglishSelected ? AppColors.primaryColor : Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class ThemeSwitch extends StatefulWidget {
  final ValueChanged<ThemeMode> onChanged;
  final ThemeMode currentThemeMode;

  const ThemeSwitch({
    super.key,
    required this.onChanged,
    required this.currentThemeMode,
  });

  @override
  _ThemeSwitchState createState() => _ThemeSwitchState();
}

class _ThemeSwitchState extends State<ThemeSwitch> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Light',
          style: TextStyle(
            color: widget.currentThemeMode == ThemeMode.light
                ? AppColors.primaryColor
                : Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),
        CupertinoSwitch(
          activeColor: AppColors.primaryColor,
          value: widget.currentThemeMode == ThemeMode.dark,
          onChanged: (value) {
            widget.onChanged(value ? ThemeMode.dark : ThemeMode.light);
          },
        ),
        Text(
          'Dark',
          style: TextStyle(
            color: widget.currentThemeMode == ThemeMode.dark
                ? AppColors.primaryColor
                : Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
