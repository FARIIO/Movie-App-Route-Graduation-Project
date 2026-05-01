import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/utils/models/page_view_model.dart';
import '../../../../core/utils/dimensions.dart';
import '../../../../core/utils/widgets/elevated_button_widget.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_routes.dart';
import '../../../core/utils/text_style.dart';


class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  bool isClicked = false;
  late PageController pageController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageController.dispose();
  }

  int cIndex = 0;

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              onPageChanged: (value) {
                cIndex = value;
                setState(() {});
              },
              controller: pageController,
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    Image.asset(
                      PageViewModel.pageList[index].image,
                      fit: BoxFit.fill,
                    ),

                    Align(
                      alignment: .bottomCenter,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: SizeConfig.screenHeight * .02,
                          horizontal: SizeConfig.screenWidth * .06,
                        ),
                        // height: SizeConfig.screenHeight * .35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(
                              SizeConfig.screenHeight * .03,
                            ),
                            topRight: Radius.circular(
                              SizeConfig.screenHeight * .03,
                            ),
                          ),
                          color: AppColors.darkGreyColor,
                        ),

                        child: Column(
                          spacing: SizeConfig.screenHeight * .02,
                          mainAxisSize: .min,

                          children: [
                            Text(
                              PageViewModel.pageList[index].title ?? " ",
                              style: AppTextStyle.bold24White,
                            ),

                            Text(
                              PageViewModel.pageList[index].subTitle ?? " ",
                              style: AppTextStyle.regular20Weight,
                            ),

                            if (PageViewModel.pageList[index].isNext == true)
                              ElevatedButtonWidget(
                                onpPressed: () async {
                                  if (index == PageViewModel.pageList.length - 1) {

                                    final prefs = await SharedPreferences.getInstance();
                                    await prefs.setBool("isFirstTime", false);

                                    Navigator.of(context).pushReplacementNamed(AppRoutes.loginScreen);

                                  } else {
                                    pageController.nextPage(
                                      duration: Duration(milliseconds: 300),
                                      curve: Curves.easeIn,
                                    );
                                  }
                                },
                                text:index<PageViewModel.pageList.length-1?"Next":"Finish" ,


                              ),
                            if (PageViewModel.pageList[index].isPrevious ==
                                true)
                              ElevatedButtonWidget(
                                onpPressed: () {
                                  pageController.previousPage(
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.easeIn,
                                  );
                                },
                                text: "Back",
                                colorText: AppColors.yellowColor,
                                backgroundColor: AppColors.darkGreyColor,
                                colorBorderSide: AppColors.yellowColor,
                              ),

                            SizedBox(height: SizeConfig.screenHeight * .04),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
              itemCount: PageViewModel.pageList.length,
            ),
          ),
        ],
      ),
    );
  }
}
