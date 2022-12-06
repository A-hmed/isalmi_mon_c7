import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:isalmi_mon_c7/providers/settings_provider.dart';
import 'package:provider/provider.dart';

class ThemeBottomSheet extends StatelessWidget {
  const ThemeBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SettingsProvider provider = Provider.of(context);
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        children: [
          InkWell(
            onTap: (){
              provider.currentTheme = ThemeMode.light;
              provider.notifyListeners();
            },
            child: Text(AppLocalizations.of(context)!.light,
      style: Theme.of(context).textTheme.bodySmall),
          ),
          SizedBox(height: 12,),
          InkWell(
            onTap: (){
              provider.currentTheme = ThemeMode.dark;
              provider.notifyListeners();
            },
            child: Text(AppLocalizations.of(context)!.dark,
                style: Theme.of(context).textTheme.bodySmall),
          ),
        ],
      ),
    );
  }
}
