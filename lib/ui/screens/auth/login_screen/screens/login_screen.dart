import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_routes.dart';
import '../../../../../core/utils/dimensions.dart';
import '../../../../../core/utils/text_style.dart';
import '../../../../../core/utils/validator/app_validator.dart';
import '../../../../../core/utils/widgets/elevated_button_widget.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/swap_language.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: SizeConfig.screenHeight * .08,
              horizontal: SizeConfig.screenWidth * .04,
            ),
            child: Column(
              spacing: SizeConfig.screenHeight * .01,
              crossAxisAlignment: .start,
              children: [
                Image.asset(
                  AppAssets.logo,
                  height: SizeConfig.screenHeight * .1,

                  width: double.infinity,
                ),
                SizedBox(height: SizeConfig.screenHeight * .02),
                Form(
                  key: formKey,
                  child: Column(
                    spacing: SizeConfig.screenHeight * .02,
                    children: [
                      CustomTextFormField(
                        controller: emailController,
                        hintText: "email".tr(),

                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        validator: AppValidator.validateEmail,
                        prefixIcon: Image.asset(AppAssets.iconEmail),
                      ),
                      CustomTextFormField(
                        controller: passwordController,
                        hintText: "password".tr(),
                        keyboardType: TextInputType.visiblePassword,
                        textInputAction: TextInputAction.done,
                        isPassword: true,
                        validator: AppValidator.validatePassword,
                        prefixIcon: Image.asset(AppAssets.iconPassword),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: .end,
                  children: [
                    TextButton(
                      onPressed: () {
                        // todo: navigator to forgetScreen
                        Navigator.of(context).pushNamed(AppRoutes.forgetScreen);
                      },
                      child: Text(
                        "forget_password".tr(),

                        style: AppTextStyle.regular14Yellow.copyWith(
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.yellowColor,
                          decorationThickness: 2,
                        ),
                      ),
                    ),
                  ],
                ),
                ElevatedButtonWidget(
                  onpPressed: () {
                    if (formKey.currentState!.validate()) {
                      Navigator.pushReplacementNamed(context, AppRoutes.home);
                    }
                  },
                  text: "login".tr(),
                ),

                Row(
                  mainAxisAlignment: .center,
                  children: [
                    Text(
                      "dont_have_account".tr(),
                      style: AppTextStyle.regular14Weight,
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: Size.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      onPressed: () {
                        // todo: navigator to forgetScreen
                        Navigator.of(
                          context,
                        ).pushNamed(AppRoutes.registerScreen);
                      },
                      child: Text(
                        "create_one".tr(),
                        style: AppTextStyle.bold14Yellow,
                      ),
                    ),
                  ],
                ),

                Row(
                  mainAxisAlignment: .center,
                  children: [
                    Expanded(
                      child: Divider(
                        endIndent: 16,
                        indent: 30,
                        thickness: 2,
                        color: AppColors.yellowColor,
                      ),
                    ),
                    Text("or".tr(), style: AppTextStyle.bold14Yellow),
                    Expanded(
                      child: Divider(
                        endIndent: 30,
                        indent: 16,
                        thickness: 2,
                        color: AppColors.yellowColor,
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    //todo: not done
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.yellowColor,
                    foregroundColor: AppColors.darkGreyColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(16),
                    ),
                    minimumSize: const Size.fromHeight(56),
                  ),
                  child: Row(
                    spacing: SizeConfig.screenWidth * .04,
                    mainAxisAlignment: .center,
                    children: [
                      Image.asset(AppAssets.googlePic),
                      Text(
                        "login_with_google".tr(),
                        style: AppTextStyle.regular16Weight.copyWith(
                          color: AppColors.darkGreyColor,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: SizeConfig.screenHeight * .01),

                Align(alignment: .center, child: SwapLanguage()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
