import 'package:flutter/material.dart';
import 'package:isalmi_mon_c7/providers/settings_provider.dart';
import 'package:provider/provider.dart';

class LanguageBottomSheet extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    SettingsProvider provider = Provider.of(context);
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        children: [
          InkWell(
            onTap: (){
              provider.currentLocale = "en";
              provider.notifyListeners();
            },
            child: Text( "English",
                style: Theme.of(context).textTheme.bodySmall),
          ),
          SizedBox(height: 12,),
          InkWell(
            onTap: (){
              provider.currentLocale = "ar";
              provider.notifyListeners();
            },
            child: Text("العربيه",
                style: Theme.of(context).textTheme.bodySmall),
          ),
        ],
      ),
    );
  }
}
