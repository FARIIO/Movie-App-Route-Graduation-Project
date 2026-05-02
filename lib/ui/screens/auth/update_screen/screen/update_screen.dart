import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/dimensions.dart';
import '../../../../../core/utils/text_style.dart';
import '../../../../../core/utils/validator/app_validator.dart';
import '../../../../../core/utils/widgets/elevated_button_widget.dart';
import '../../login_screen/widgets/custom_text_field.dart';
import '../widgets/custom_show_item_avatar.dart';

class UpdateScreen extends StatefulWidget {
  const UpdateScreen({super.key});

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  List<String> avListImage = [
    AppAssets.av1,
    AppAssets.av2,
    AppAssets.av3,
    AppAssets.av4,
    AppAssets.av5,
    AppAssets.av6,
    AppAssets.av7,
    AppAssets.av8,
    AppAssets.av9,
  ];
  int cIndex = -1;

  @override
  void initState() {
    emailController = TextEditingController();

    nameController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();

    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "pick_avatar".tr(),
            style: AppTextStyle.regular14Yellow.copyWith(fontSize: 16),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: SizeConfig.screenWidth * .04,
              vertical: SizeConfig.screenWidth * .04,
            ),
            child: Column(
              crossAxisAlignment: .start,
              spacing: SizeConfig.screenHeight * .02,

              children: [
                InkWell(
                  onTap: () {
                    showBottomSheetAvatar();
                  },
                  child: Image.asset(
                    cIndex == -1 ? AppAssets.avatar1 : avListImage[cIndex],
                    height: SizeConfig.screenHeight * .14,

                    width: double.infinity,
                  ),
                ),

                Form(
                  key: formKey,
                  child: Column(
                    spacing: SizeConfig.screenHeight * .02,
                    children: [
                      CustomTextFormField(
                        controller: nameController,
                        hintText: "name".tr(),
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        validator: AppValidator.validateName,
                        prefixIcon: Image.asset(AppAssets.iconName),
                      ),
                      CustomTextFormField(
                        controller: emailController,
                        hintText: "email".tr(),
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        validator: AppValidator.validateEmail,
                        prefixIcon: Image.asset(AppAssets.iconEmail),
                      ),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "reset_password".tr(),
                    style: AppTextStyle.regular20Weight,
                  ),
                ),

                ElevatedButtonWidget(
                  backgroundColor: AppColors.redColor,

                  colorText: AppColors.whiteColor,
                  onpPressed: () {
                    // todo: not done
                  },
                  text: "delete_account".tr(),
                ),
                ElevatedButtonWidget(
                  onpPressed: () {
                    // todo: not done
                  },
                  text: "update_data".tr(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showBottomSheetAvatar() {
    showModalBottomSheet(
      context: context,
      builder: (context) => CustomShowItemAvatar(
        avatarList: avListImage,
        cIndex: cIndex,
        onTap: (int index) {
          setState(() {
            cIndex = index;
          });
          Navigator.pop(context);
        },
      ),
    );
  }
}
