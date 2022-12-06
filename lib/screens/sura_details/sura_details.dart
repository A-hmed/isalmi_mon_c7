import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../MyThemeData.dart';

class SuraDetails extends StatefulWidget {
  static String routeName= "Sura details";

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  List<String> suraLines = [];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as SuraDetailsArguments;
    if(suraLines.isEmpty){
      readSuraFile(args.fileName);
    }


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
          title: Text(args.suraName, style: TextStyle(color: MyThemeData.accentColor,
              fontSize: 30, fontWeight: FontWeight.bold),),
        ),
        body: ListView.builder(
            itemCount: suraLines.length,
            itemBuilder: (_, index) => Column(
              children: [
                Center(
                  child: Text("${suraLines[index]} (${index+1})",
                    textDirection: TextDirection.rtl,
                    style: TextStyle(fontSize: 23),),
                ),
                Divider(color: MyThemeData.primirayColor, thickness: 3,)
              ],
            )
        ),
      ),
    );
  }

  readSuraFile(String fileName) async{
    String fileContent = await rootBundle.loadString("assets/files/${fileName}");
    suraLines = fileContent.split("\n");
    setState((){});
  }
}

class SuraDetailsArguments {
  String suraName;
  String fileName;
  SuraDetailsArguments(this.suraName,this.fileName);
}
