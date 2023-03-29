import "package:flutter/material.dart";
import "package:firebase_core/firebase_core.dart";
import "package:provider/provider.dart";


import "package:mindscape/const/light_theme_const.dart";
import "package:mindscape/const/dark_theme_const.dart";


import "package:mindscape/providers/settings_provider.dart";


import "package:mindscape/screens/onboard/onboard.dart";
import "package:mindscape/screens/auth/auth.dart";


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();  
  await Firebase.initializeApp();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create : (context) => SettingsProvider()
        ),
      ],
      child : const MindScapeApp()
    )
  );
  return; 
}


class MindScapeApp extends StatelessWidget {
  const MindScapeApp({ super.key }); 

  @override
  Widget build(BuildContext context){

    final wSettings = context.watch<SettingsProvider>();
    final isFirstInstall = wSettings.getBoolPreference("isFirstInstall");
    final isDarkTheme = wSettings.getBoolPreference("isDarkTheme");

    return MaterialApp(
      title : "MindScape",
      debugShowCheckedModeBanner: false,

      theme : lightTheme,
      darkTheme : darkTheme,
      themeMode : (!isDarkTheme) ? 
        ThemeMode.dark :
        ThemeMode.light,

      home : (isFirstInstall) ?
        const OnboardView() : 
        const AuthView()
    );
  }
}