import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:isalmi_mon_c7/screens/home/tabs/ahadeth/ahadeth_tab.dart';

import '../../MyThemeData.dart';


class HadethDetailsScreen extends  StatelessWidget{
  static String routeName = "hadeth screen";


  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as HadethDM;


    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/images/default_bg.png"),fit: BoxFit.fill)
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          elevation: 0,
          title: Text(args.title, style: TextStyle(color: MyThemeData.accentColor,
              fontSize: 30, fontWeight: FontWeight.bold),),
        ),
        body: SingleChildScrollView(
          child: Padding(
                padding: EdgeInsets.symmetric(vertical: 32, horizontal: 12),
              child: Text(args.content, style: TextStyle(fontSize: 24, color: MyThemeData.accentColor,), textDirection: TextDirection.rtl,)),
        ),
      ),
    );
  }
}
