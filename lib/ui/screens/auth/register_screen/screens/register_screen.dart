import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_routes.dart';
import '../../../../../core/utils/dimensions.dart';
import '../../../../../core/utils/text_style.dart';
import '../../../../../core/utils/validator/app_validator.dart';
import '../../../../../core/utils/widgets/elevated_button_widget.dart';
import '../../../../../core/utils/widgets/show_dialog_utills.dart';
import '../../cubit/auth_cubit.dart';
import '../../login_screen/widgets/custom_text_field.dart';
import '../../login_screen/widgets/swap_language.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  late TextEditingController phoneController;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    phoneController = TextEditingController();
    nameController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    phoneController.dispose();
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<String> imageAvatar = [
      AppAssets.avatar1,
      AppAssets.avatar2,
      AppAssets.avatar3,
    ];
    SizeConfig.init(context);
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthLoadingStat) {
          return ShowDialogUtils.showLoading(context: context);
        } else if (state is RegisterSuccessState) {
          ShowDialogUtils.pop(context: context);
          ShowDialogUtils.showSuccess(
            context: context,
            message: "Register Success",
          );
        } else if (state is AuthFailureState) {
          ShowDialogUtils.pop(context: context);

          ShowDialogUtils.showError(
            context: context,
            errorMessage: state.errorMessage,
          );
        }
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              "register".tr(),
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
                spacing: SizeConfig.screenHeight * .02,

                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                      height: SizeConfig.screenHeight * 0.15,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 3),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      enlargeCenterPage: true,
                      enlargeFactor: 0.3,
                      viewportFraction: 0.5,
                      scrollDirection: Axis.horizontal,
                      enableInfiniteScroll: true,
                    ),
                    items: imageAvatar.map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset(
                              i,
                              fit: BoxFit.cover,
                              // width: SizeConfig.screenWidth * 0.4,
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),

                  Text(
                    "avatar".tr(),
                    style: AppTextStyle.regular16Weight,
                    textAlign: .center,
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
                        CustomTextFormField(
                          controller: passwordController,
                          hintText: "password".tr(),
                          keyboardType: TextInputType.visiblePassword,
                          textInputAction: TextInputAction.next,
                          isPassword: true,
                          validator: AppValidator.validatePassword,
                          prefixIcon: Image.asset(AppAssets.iconPassword),
                        ),
                        CustomTextFormField(
                          controller: confirmPasswordController,
                          hintText: "confirm_password".tr(),
                          keyboardType: TextInputType.visiblePassword,
                          textInputAction: TextInputAction.next,
                          isPassword: true,
                          validator: (value) {
                            return AppValidator.validateConfirmPassword(
                              value,
                              passwordController.text,
                            );
                          },

                          prefixIcon: Image.asset(AppAssets.iconPassword),
                        ),
                        CustomTextFormField(
                          controller: phoneController,
                          hintText: "phone_number".tr(),
                          keyboardType: TextInputType.phone,
                          textInputAction: TextInputAction.done,

                          validator: AppValidator.validatePhone,
                          prefixIcon: Image.asset(AppAssets.iconPhone),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButtonWidget(
                    onpPressed: () {
                      if (formKey.currentState!.validate()) {
                        BlocProvider.of<AuthCubit>(context).register(
                          email: emailController.text,
                          password: passwordController.text,
                          name: nameController.text,
                        );
                      }
                    },
                    text: "create_account".tr(),
                  ),

                  Row(
                    mainAxisAlignment: .center,
                    children: [
                      Text(
                        "already_have_account".tr(),
                        style: AppTextStyle.regular14Weight,
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: Size.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        onPressed: () {
                          Navigator.of(
                            context,
                          ).pushNamed(AppRoutes.loginScreen);
                        },
                        child: Text(
                          "login".tr(),
                          style: AppTextStyle.bold14Yellow,
                        ),
                      ),
                    ],
                  ),
                  SwapLanguage(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
