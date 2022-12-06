import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:isalmi_mon_c7/MyThemeData.dart';
import 'package:isalmi_mon_c7/providers/settings_provider.dart';
import 'package:isalmi_mon_c7/screens/hadeth_details/hadeth_details.dart';
import 'package:isalmi_mon_c7/screens/home/home_screen.dart';
import 'package:isalmi_mon_c7/screens/sura_details/sura_details.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
void main() {
  runApp( ChangeNotifierProvider(
      create: (_) {
        return SettingsProvider();
      },
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SettingsProvider provider = Provider.of(context);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales:const [
        Locale('en'),
        Locale('ar'),
      ],
      locale: Locale(provider.currentLocale),
      themeMode: provider.currentTheme,
      routes: {
        HomeScreen.routeName: (_)=> HomeScreen(),
        SuraDetails.routeName: (_) => SuraDetails(),
        HadethDetailsScreen.routeName: (_) => HadethDetailsScreen()
      },
      initialRoute: HomeScreen.routeName,
    );

  }
}
