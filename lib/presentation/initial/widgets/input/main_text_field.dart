import 'package:dsa_teaching_web/core/utils/theme/app_color_theme.dart';
import 'package:dsa_teaching_web/core/utils/theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MainTextField extends StatefulWidget {
  const MainTextField({
    this.label,
    this.labelText,
    this.onChanged,
    this.controller,
    this.inputFormatters,
    this.obscureText = false,
    this.focusNode,
    this.inputAction = TextInputAction.next,
    super.key,
  });

  final Widget? label;
  final bool obscureText;
  final String? labelText;
  final FocusNode? focusNode;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputAction inputAction;

  @override
  State<MainTextField> createState() => _MainTextFieldState();
}

class _MainTextFieldState extends State<MainTextField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  void _toggleVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = getColorScheme(context);
    final textTheme = getTextTheme(context);

    return TextField(
      controller: widget.controller,
      onChanged: widget.onChanged,
      obscureText: _obscureText,
      focusNode: widget.focusNode,
      textInputAction: widget.inputAction,
      cursorColor: colorScheme.primaryFixed,
      cursorHeight: 20,
      inputFormatters: widget.inputFormatters,
      onTapOutside: (_) {
        widget.focusNode?.unfocus();
      },
      style: textTheme.labelMedium?.copyWith(
        color: colorScheme.onSurface.withAlpha(255),
      ),
      decoration: InputDecoration(
        label: widget.label,
        labelText: widget.labelText,
        labelStyle: textTheme.labelSmall,
        floatingLabelStyle: textTheme.labelSmall?.copyWith(
          color: colorScheme.primaryFixed,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: colorScheme.onSurface,
            width: 2,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: colorScheme.primaryFixed,
            width: 2,
          ),
        ),
        suffixIcon: widget.obscureText
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                  color: colorScheme.onSurface,
                ),
                onPressed: _toggleVisibility,
              )
            : null,
      ),
    );
  }
}
