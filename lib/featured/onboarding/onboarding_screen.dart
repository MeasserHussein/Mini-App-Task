import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:naqla_task/core/units/extention.dart';

import '../../core/units/app_route/app_routes.dart';
import '../../core/widgets/language_drop_down.dart';
import '../../generated/assets.dart';
import 'model/onBoardingModel.dart';

class OnboardingScreen extends StatefulWidget {


  const OnboardingScreen({Key? key, }) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  List<OnboardingPageModel> _pages(BuildContext context) => [
    OnboardingPageModel(
      imageAsset: Assets.imagesShopping,
      title: context.productsDiscover,
      description: context.explore,
    ),
    OnboardingPageModel(
      imageAsset: Assets.imagesPayment,
      title: context.payment,
      description: context.shop,
    ),
    OnboardingPageModel(
      imageAsset: Assets.imagesEcb2bdc985c44e0fB64bE933a6452d94,
      title: context.delivery,
      description: context.get,
    ),
  ];

  void _nextPage() {
    if (_currentPage < _pages(context).length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    context.locale.languageCode;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 40.h),
        child: Column(
          children: [
            Align(child: LanguageDropDownWidget()),
            Align(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: (){
                  context.go(AppRoutes.product);
                },
                child: Text(
                  context.skip,
                  style: TextStyle(color: Colors.grey[600], fontSize: 16.sp),
                ),
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _pages(context).length,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  final page = _pages(context)[index];
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 250.h,
                        child: Image.asset(page.imageAsset, fit: BoxFit.contain),
                      ),
                      SizedBox(height: 30.h),
                      Text(
                        page.title,
                        style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 15.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.w),
                        child: Text(
                          page.description,
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.black54,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(_pages(context).length, (index) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: EdgeInsets.symmetric(horizontal: 5.w),
                  width: _currentPage == index ? 20.w : 8.w,
                  height: 8.h,
                  decoration: BoxDecoration(
                    color: _currentPage == index ? Colors.blue : Colors.grey[400],
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                );
              }),
            ),
            SizedBox(height: 30.h),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _nextPage,
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 14.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
                child:_currentPage == _pages(context).length - 1 ? GestureDetector(
                  onTap: ()=>context.go(AppRoutes.product),
                  child: Text(
                     context.getStart ,
                    style: TextStyle(fontSize: 18.sp),
                  ),
                ):Text(
                  context.next ,
                  style: TextStyle(fontSize: 18.sp),
                ) ,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
