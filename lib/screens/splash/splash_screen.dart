
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_app_25_26/core/constants/app_strings.dart';
import 'package:my_app_25_26/core/constants/app_colors.dart';
import 'package:my_app_25_26/services/service_storage.dart';
import 'package:my_app_25_26/screens/home/home_screen.dart';
import 'package:my_app_25_26/screens/onboarding/onboarding_screen.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _showLogo = false ;
  bool _showText = false ;
  Timer? _timer ;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _startAnimations();
    _startTimer();
  }
  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();

  }
  void _startAnimations(){
    Future.delayed(Duration(microseconds: 100) , (){
      if(mounted){
        setState(() => _showLogo = true);
      }

    });

    Future.delayed(Duration(microseconds: 2000) , (){
      if(mounted){
        setState(() => _showText = true);
      }

    });
  }

  void _startTimer(){
    _timer = Timer(Duration(seconds: 3),_navigateToNextScreen);
  }

  void _navigateToNextScreen(){

    if(!mounted) return ;
    final bool onboardingComplete = ServiceStorage.instance.isOnboardingComplete;
    //Navigator.pushReplacement(context,
       // MaterialPageRoute<void>(
           // builder: (context)  => onboardingComplete
           // ? const HomeScreen() : const OnboardingScreen(),
       // ),
    //);

    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
          pageBuilder:(context , animation , secondaryAnimation) =>
          onboardingComplete
          ? const HomeScreen() : const OnboardingScreen(),
          transitionsBuilder: (context , animation,secondaryAnimation , child){
            return FadeTransition(
                opacity: animation,
              child: child,
            );
          },
          transitionDuration: (Duration(milliseconds: 300)


      )




    )




  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildLogo(),
            SizedBox(
              height: 24,
            ),
            _buildAppName(),
            SizedBox(
              height: 8,
            ),
            _buildAppSlogan(),
            SizedBox(
              height: 48,
            ),
            _buildLoadingIndicator()

          ],
        ),
      ),
    );
  }

  Widget _buildLogo(){
    return AnimatedOpacity(
      opacity: _showLogo ? 1 : 0,
      duration: Duration(microseconds: 500),
      curve: Curves.easeIn,
      child: AnimatedScale(
        scale: _showLogo ? 1 : 0,
        duration: Duration(microseconds: 500),
        curve: Curves.easeOut,
        child: Container(
          width: 124,
          height: 124,
          decoration: BoxDecoration(
            color: AppColors.primary.withAlpha(180),
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: AppColors.primary,
                blurRadius: 20,
                offset: Offset(0, 10)
              )
            ]
          ),
          child: Icon(
            Icons.task_alt,
            size: 45,
            color: AppColors.surface.withAlpha(200),
          ),
        ),
      ),
    );
  }

  Widget _buildAppName(){
    return AnimatedOpacity(
      opacity: _showText ? 1 : 0,
      duration: Duration(microseconds: 500),
      child: Text(
        AppStrings.appName,
        style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          letterSpacing: 1.2
        ),
      ),
    );
  }

  Widget _buildAppSlogan(){
    return AnimatedOpacity(
      opacity: _showText ? 1 : 0,
      duration: Duration(microseconds: 500),
      child: Text(
        AppStrings.appSlogan,
        style: TextStyle(
            fontSize: 16,
            color: AppColors.textSecondary
        ),
      ),
    );
  }

  Widget _buildLoadingIndicator(){
    return AnimatedOpacity(
      opacity: _showText ? 1 : 0,
      duration: Duration(microseconds: 500),
      child: SizedBox(
        height:24 ,
        width:24 ,
        child:CircularProgressIndicator(
          strokeWidth: 8.0,
          valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),

        ) ,
      ),
    );
  }

}
