import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:isalmi_mon_c7/screens/hadeth_details/hadeth_details.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../MyThemeData.dart';

class AhadethTab extends StatefulWidget {
  @override
  State<AhadethTab> createState() => _AhadethTabState();
}

class _AhadethTabState extends State<AhadethTab> {
  List<HadethDM> ahadethDM = [];

  @override
  Widget build(BuildContext context) {
    if(ahadethDM.isEmpty) readHadethFile();

    return Column(
      children: [
        Expanded(child: Image.asset("assets/images/hadeth_logo.png")),
        Divider(
          color: MyThemeData.primirayColor,
          thickness: 3,
        ),
        Text(
          AppLocalizations.of(context)!.ahadeth,
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
        ),
        Divider(
          color: MyThemeData.primirayColor,
          thickness: 3,
        ),
        Expanded(
            flex: 2,
            child: ListView.separated(
              separatorBuilder: (_, index){
                 return Divider(color: MyThemeData.primirayColor, thickness: 3,);
              },
                itemCount: ahadethDM.length,
                itemBuilder: (_, index) =>   InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, HadethDetailsScreen.routeName, arguments:ahadethDM[index] );
                  },
                  child: Text(ahadethDM[index].title,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
                ),)
        )
      ],
    );
  }

  readHadethFile() async {
    String ahadeth = await rootBundle.loadString("assets/files/ahadeth.txt");
    List<String> ahadethList = ahadeth.split("#\r\n");
    for (int i = 0; i < ahadethList.length; i++) {
      List<String> hadethLines = ahadethList[i].split("\n");
      /// le kol el ahadeth
      String title = hadethLines[0];
      hadethLines.removeAt(0);
      String content = hadethLines.join();
      ahadethDM.add(HadethDM(title, content));
    }
    setState(() {});
  }
}
class HadethDM {
  String title;
  String content;
  HadethDM(this.title, this.content);
}
