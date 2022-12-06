import 'package:flutter/material.dart';
import 'package:isalmi_mon_c7/MyThemeData.dart';
import 'package:isalmi_mon_c7/screens/sura_details/sura_details.dart';

class SuraNameItem extends StatelessWidget {
  String suraName;
  int index;
  SuraNameItem(this.suraName, this.index);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, SuraDetails.routeName,
            arguments: SuraDetailsArguments(suraName, "${index+1}.txt"));
      },
      child: Container(
        child: Center(child: Column(
          children: [
            Text(suraName, style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
            Divider(color: MyThemeData.primirayColor, thickness: 3,),
          ],
        )),
      ),
    );
  }
}
