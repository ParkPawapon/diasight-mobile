import 'package:diasight_app/core/theme/tokens/colors/app_color_palette.dart';
import 'package:diasight_app/core/theme/tokens/colors/app_colors.dart';
import 'package:diasight_app/core/theme/tokens/typography/app_font_families.dart';
import 'package:diasight_app/core/theme/tokens/typography/app_font_sizes.dart';
import 'package:flutter/material.dart';

class SearchBox extends StatefulWidget {
  final String hintText;
  final ValueChanged<String>? onSearchSubmitted; 
  final VoidCallback? onClear; 

  const SearchBox({
    super.key,
    this.hintText = 'ค้นหา',
    this.onSearchSubmitted,
    this.onClear,
  });

  @override
  State<SearchBox> createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  final TextEditingController searchController = TextEditingController();
  bool showClearButton = false;

  @override
  void initState() {
    super.initState();
    searchController.addListener(() {
      setState(() {
        showClearButton = searchController.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 36),
      height: 40,
      decoration: BoxDecoration(
        color: AppColors.borderDark.withValues(alpha: 0.1), 
        borderRadius: BorderRadius.circular(10)
      ),
      child: TextField(
        controller: searchController,
        onSubmitted: (value) {
          if (widget.onSearchSubmitted != null) {
            widget.onSearchSubmitted!(value); 
          }
        }, 
        textAlignVertical: TextAlignVertical.center,
        style: const TextStyle(
          fontFamily: AppFontFamilies.kanit,
          fontSize: 16,
          color: AppColorPalette.deepViolet,
        ),
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: TextStyle(
            fontFamily: AppFontFamilies.kanit,
            fontSize: AppFontSizes.base,
            color: AppColorPalette.deepViolet.withValues(alpha: 0.4), 
          ),
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.grey, 
            size: 20,
          ),
          isDense: true,

          suffixIcon: showClearButton
              ? IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  icon: const Icon(Icons.cancel, color: Colors.grey, size: 20),
                  onPressed: () {
                    searchController.clear(); 
                    FocusScope.of(context).unfocus(); 
                    if (widget.onClear != null) {
                      widget.onClear!(); 
                    }
                  },
                )
              : null,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        ),
      ),
    );
  }
}