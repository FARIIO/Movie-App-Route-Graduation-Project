import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/dimensions.dart';

class SwapLanguage extends StatefulWidget {
  SwapLanguage({super.key});

  @override
  State<SwapLanguage> createState() => _SwapLanguageState();
}

class _SwapLanguageState extends State<SwapLanguage> {
  String selectedLang = 'en';

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    selectedLang = context.locale.languageCode; // 👈 هنا
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: AppColors.yellowColor, width: 2),
      ),
      child: Row(
        mainAxisSize: .min,
        spacing: SizeConfig.screenWidth * .03,

        children: [
          buildContainer(language: "en", image: AppAssets.americanFlag),
          buildContainer(language: "ar", image: AppAssets.egyptFlag),
        ],
      ),
    );
  }

  Widget buildContainer({required String language, required String image}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: selectedLang == language
              ? AppColors.yellowColor
              : Colors.transparent,
          width: 4,
        ),
      ),
      child: InkWell(
        onTap: () {
          setState(() {
            selectedLang = language;
          });
          context.setLocale(Locale(language));
        },
        child: Image.asset(image),
      ),
    );
  }
}
