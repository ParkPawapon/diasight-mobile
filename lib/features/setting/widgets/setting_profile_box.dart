import 'package:diasight_app/core/theme/tokens/colors/app_colors.dart';
import 'package:diasight_app/core/theme/tokens/typography/app_font_families.dart';
import 'package:diasight_app/core/theme/tokens/typography/app_font_sizes.dart';
import 'package:flutter/material.dart';

class ProfileBox extends StatefulWidget {
  final String profile;
  final String name;
  const ProfileBox({super.key, required this.profile, required this.name});

  @override
  State<ProfileBox> createState() => _ProfileBoxState();
}

class _ProfileBoxState extends State<ProfileBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 36),
      padding: const EdgeInsets.only(right: 10, left: 20),
      height: 100,
      decoration: BoxDecoration(
        boxShadow:  [
          BoxShadow(
            color: AppColors.brand.withValues(alpha: 0.5),
            blurRadius: 5,
            spreadRadius: -2,
            offset: const Offset(0, 3),
          ),
        ],
        borderRadius: BorderRadius.circular(10),
        color: AppColors.background,
      ),

      child: Row(
        children: [
          Image.asset(width: 60, height: 60, widget.profile),

          const SizedBox(width: 20,),

          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontFamily: AppFontFamilies.kanit,
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: AppColors.brand,
                  ),
                ),
                Text(
                  'ข้อมูลส่วนตัว, แก้ไขรูปโปรไฟล์, อื่นๆ',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontFamily: AppFontFamilies.kanit,
                    fontSize: AppFontSizes.description1,
                    fontWeight: FontWeight.w200,
                    color: AppColors.brand.withValues(alpha: 0.6) 
                  ),
                )
              ],
            ),
          ),

          const Icon(
            Icons.chevron_right,
            color: AppColors.brandSoft,
          ),
        ],
      ),
    );
  }
}
