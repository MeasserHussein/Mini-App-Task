import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../units/styles.dart';


class LanguageDropDownWidget extends StatefulWidget {
  const LanguageDropDownWidget({super.key});

  @override
  State<LanguageDropDownWidget> createState() => _LanguageDropDownWidgetState();
}

class _LanguageDropDownWidgetState extends State<LanguageDropDownWidget> {
  List<String> language = ['English', 'Arabic'];
  String? selectLanguage;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        selectLanguage = context.locale.languageCode == 'ar'
            ? 'Arabic'
            : 'English';
      });
    });
  }

  Future<void> _changeLanguage(String? lang) async {
    if (lang == null) return;

    Locale newLocale = lang == 'Arabic'
        ? const Locale('ar')
        : const Locale('en');
    await context.setLocale(newLocale);

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('languageCode', newLocale.languageCode);

    setState(() {
      selectLanguage = lang;
      //context.go(AppRoutes.startApp);
    });
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        iconStyleData: IconStyleData(
            icon: Icon(Icons.keyboard_arrow_down_outlined,),
        ),
        underline: SizedBox.shrink(),
        value: selectLanguage,
        dropdownStyleData: DropdownStyleData(
          width: 119.w,
          offset: context.locale.languageCode == 'en'? Offset(-60.w, 30.h):Offset(60.w, 30.h),
          maxHeight: 202.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.grey, width: 1.5),
          ),
        ),
        selectedItemBuilder: (BuildContext context) {
          return language.map((String value) {
            return Align(
              alignment: Alignment.centerRight,
              child: Text(
                value.substring(0,2),
                style: TextStyle(
                  fontSize: 16.sp,
                ),
              ),
            );
          }).toList();
        },
        items: language.map((value) => DropdownMenuItem<String>(
          value: value,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(value,style: FontStyles.font16WeightReqular(context).copyWith(
                  color: value == selectLanguage ? Colors.blue:Colors.grey
              ),),
              if (value == selectLanguage)
                Icon(Icons.check, color:Colors.blue, size: 18.sp),
            ],
          ),
        ),
        )
            .toList(),
        onChanged: _changeLanguage,
      ),
    );
  }
}
