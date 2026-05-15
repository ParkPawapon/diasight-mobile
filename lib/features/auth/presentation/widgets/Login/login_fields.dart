import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../../core/theme/tokens/colors/app_color_palette.dart';
import '../../../../../core/theme/tokens/typography/app_font_sizes.dart';
import '../../../../../core/theme/tokens/typography/app_font_families.dart';

class Field extends StatefulWidget {
  final TextInputType type;
  final String title;
  final String placeholder;
  final bool obscure;
  final List<TextInputFormatter>? inputFormat;
  final List<String>? options; 
  final Function(String?)? onChanged;

  const Field({
    super.key,
    required this.type,
    required this.title,
    required this.placeholder,
    this.obscure = false,
    this.inputFormat,
    this.options, 
    this.onChanged,
  });

  @override
  State<Field> createState() => _FieldState();
}

class _FieldState extends State<Field> {
  bool ishidden = true;
  String? selectedValue; 

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: const TextStyle(
            color: AppColorPalette.deepViolet,
            fontSize: AppFontSizes.base,
            fontFamily: AppFontFamilies.kanit,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 5),
        Container(
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: AppColorPalette.white,
                blurRadius: 15,
                spreadRadius: -12,
                offset: Offset(0, 1),
              ),
            ],
          ),
          child: widget.options != null 
            ? _buildDropdown() 
            : _buildTextField(), 
        ),
      ],
    );
  }


  Widget _buildDropdown() {
    return DropdownButtonFormField<String>(
      value: selectedValue,
      style: TextStyle(
        color: selectedValue == null 
          ? AppColorPalette.softLavender
          : AppColorPalette.lavender,
        fontFamily: AppFontFamilies.kanit, 
        fontWeight: FontWeight.w600,
      ),
      decoration: _buildInputDecoration(),
      icon: const Icon(Icons.keyboard_arrow_down, color: AppColorPalette.lavender),
      items: widget.options!.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (val) {
        setState(() => selectedValue = val);
        if (widget.onChanged != null) widget.onChanged!(val);
      },
    );
  }


  Widget _buildTextField() {
    return TextField(
      keyboardType: widget.type,
      inputFormatters: widget.inputFormat,
      obscureText: widget.obscure ? ishidden : false,
      obscuringCharacter: '●',
      style: const TextStyle(
        color: AppColorPalette.lavender,
        fontFamily: AppFontFamilies.montserrat,
        fontWeight: FontWeight.w600,
      ),
      decoration: _buildInputDecoration(),
    );
  }

  InputDecoration _buildInputDecoration() {
    return InputDecoration(
      filled: true,
      fillColor: AppColorPalette.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      hintText: widget.placeholder,
      hintStyle: const TextStyle(
        color: AppColorPalette.softLavender,
        fontFamily: AppFontFamilies.kanit,
      ),
      suffixIcon: widget.obscure
          ? IconButton(
              onPressed: () => setState(() => ishidden = !ishidden),
              icon: Icon(ishidden ? Icons.visibility_off : Icons.visibility,
                  color: AppColorPalette.lavender, size: 20),
            )
          : null,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppColorPalette.softLavender, width: 0.5),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppColorPalette.lavender),
      ),
    );
  }
}