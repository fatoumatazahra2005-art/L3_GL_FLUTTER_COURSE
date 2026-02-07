import 'package:flutter/material.dart';
import 'package:my_app_25_26/core/theme/app_theme.dart';
import 'package:my_app_25_26/services/service_storage.dart';
import 'package:my_app_25_26/screens/splash/splash_screen.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await ServiceStorage.instance.init();
  runApp(const SunuTask());
}

class SunuTask extends StatelessWidget {
  const SunuTask({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme:AppTheme.lightTheme ,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      home: SplashScreen(),
    );
  }
}




