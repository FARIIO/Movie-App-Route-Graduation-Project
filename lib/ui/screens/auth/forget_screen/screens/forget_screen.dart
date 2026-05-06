import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/dimensions.dart';
import '../../../../../core/utils/text_style.dart';
import '../../../../../core/utils/validator/app_validator.dart';
import '../../../../../core/utils/widgets/elevated_button_widget.dart';
import '../../login_screen/widgets/custom_text_field.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("forget_password".tr(),style: AppTextStyle.regular14Yellow.copyWith(fontSize: 16),),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            vertical: SizeConfig.screenHeight * .04,
            horizontal: SizeConfig.screenWidth * .04,
          ),
          child: Column(
            crossAxisAlignment: .start,
            spacing: SizeConfig.screenHeight * .02,
            children: [
              Image.asset(AppAssets.forgetPassword),
              CustomTextFormField(
                hintText: "email".tr(),
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                validator: AppValidator.validateEmail,
                prefixIcon:Image.asset(AppAssets.iconEmail),
              ),
              ElevatedButtonWidget(onpPressed: () {}, text: "verify_email".tr()),
            ],
          ),
        ),
      ),
    );
  }
}