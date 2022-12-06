import 'package:flutter/material.dart';
import 'package:isalmi_mon_c7/MyThemeData.dart';
import 'package:isalmi_mon_c7/providers/settings_provider.dart';
import 'package:isalmi_mon_c7/screens/home/tabs/ahadeth/ahadeth_tab.dart';
import 'package:isalmi_mon_c7/screens/home/tabs/quran/quran_tab.dart';
import 'package:isalmi_mon_c7/screens/home/tabs/radio_tab.dart';
import 'package:isalmi_mon_c7/screens/home/tabs/sebha_tab.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:isalmi_mon_c7/screens/home/tabs/settings/settings_tab.dart';
import 'package:provider/provider.dart';
class HomeScreen extends StatefulWidget {
   static String routeName = "home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   int currentIndex = 4;

   List<Widget> tabs = [QuranTab(), AhadethTab(), SebhaTab(), RadioTab(), SettingsTab()];
  @override
  Widget build(BuildContext context) {
    SettingsProvider provider = Provider.of(context);
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: provider.currentTheme == ThemeMode.light?
            AssetImage("assets/images/default_bg.png") :
            AssetImage("assets/images/dark_bg.png"),fit: BoxFit.fill)
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.islami, style: TextStyle(color: MyThemeData.accentColor,
              fontSize: 30, fontWeight: FontWeight.bold),),
        ),
       bottomNavigationBar: Theme(
         data: Theme.of(context).copyWith(canvasColor: Theme.of(context).primaryColor),
         child: BottomNavigationBar(
           currentIndex: currentIndex,
           onTap: (index){
             currentIndex = index;
             setState(() {});
           },
           items: const [
             BottomNavigationBarItem(icon: ImageIcon(AssetImage("assets/images/icon_quran.png")), label: "Quran"),
             BottomNavigationBarItem(icon: ImageIcon(AssetImage("assets/images/icon_hadeth.png")), label: "Ahadeth"),
             BottomNavigationBarItem(icon: ImageIcon(AssetImage("assets/images/icon_sebha.png")), label: "Sebha"),
             BottomNavigationBarItem(icon: ImageIcon(AssetImage("assets/images/icon_radio.png")), label: "Radio"),
             BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings")
           ],
         ),
       ),
        body: tabs[currentIndex],
      ),
    );
  }
}
