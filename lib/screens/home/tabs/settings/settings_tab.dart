import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'ThemeBottomSheet.dart';
import 'language_bottom_sheet.dart';
class SettingsTab extends StatefulWidget{

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text(AppLocalizations.of(context)!.language, textAlign: TextAlign.start ,style: Theme.of(context).textTheme.titleSmall,),
          ),
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8)
            ),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 12),
              child: InkWell(
                onTap: (){
                  showLanguageBottomSheet();
                },
                child: Row(
                  children: [
                    Container(
                        margin: EdgeInsets.symmetric(horizontal: 12),
                        child: Text("English", style: Theme.of(context).textTheme.bodySmall,)),
                    Spacer(),
                    Icon(Icons.arrow_downward)
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text(AppLocalizations.of(context)!.mode, textAlign: TextAlign.start ,style: Theme.of(context).textTheme.titleSmall,),
          ),
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8)
            ),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 12),
              child: InkWell(
                onTap: (){
                  showModeBottomSheet();
                },
                child: Row(
                  children: [
                    Container(
                        margin: EdgeInsets.symmetric(horizontal: 12),
                        child: Text(AppLocalizations.of(context)!.light, style: Theme.of(context).textTheme.bodySmall,)),
                    Spacer(),
                    Icon(Icons.arrow_downward)
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void showModeBottomSheet() {
    showModalBottomSheet(context: context, builder: (context) {
      return ThemeBottomSheet();
    });
  }

  void showLanguageBottomSheet() {
    showModalBottomSheet(context: context, builder: (context) {
      return LanguageBottomSheet();
    });
  }
}
