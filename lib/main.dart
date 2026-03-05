import 'package:flutter/material.dart';
import 'package:SunuTask/core/theme/app_theme.dart';
import 'package:SunuTask/services/service_storage.dart';
import 'package:SunuTask/screens/splash/splash_screen.dart';
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




