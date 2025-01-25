import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:honey_comp/core/constants/app_colors.dart';
import 'package:honey_comp/core/helper_functions/routes_generator.dart';
import 'package:honey_comp/core/services/shared_preferences_singleton.dart';
import 'package:honey_comp/features/splash/presentation/view/splash_view.dart';

import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferenceSingleton.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData(
        primaryColor: AppColors.primaryColor,
        fontFamily: 'Cairo',
      ),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: const Locale('en'),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: routerGenerator,
      initialRoute: SplashView.roteName,
    );
  }
}
