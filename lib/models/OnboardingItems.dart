
import 'package:flutter/material.dart';
import 'package:SunuTask/core/constants/app_strings.dart';
import 'package:SunuTask/core/constants/app_colors.dart';


///////////////////////////////////////////////////////////////////



class OnboardingItems {
  final String title;
  final String desc;
  final IconData icon;
  final Color color;

  OnboardingItems({
    required this.title,
    required this.desc,
    required this.icon,
    required this.color,
  });
}


final List<OnboardingItems> onboardingList = [
  OnboardingItems(
    title: AppStrings.onboardingTitle1,
    desc: AppStrings.onboardingDesc1,
    icon: Icons.checklist,
    color: AppColors.textPrimary,

  ),
  OnboardingItems(
    title: AppStrings.onboardingTitle2,
    desc: AppStrings.onboardingDesc2,
    icon: Icons.schedule,
    color:AppColors.textPrimary,
  ),
  OnboardingItems(
    title: AppStrings.onboardingTitle3,
    desc: AppStrings.onboardingDesc3,
    icon: Icons.task_alt,
    color: AppColors.textPrimary,
  ),
];

