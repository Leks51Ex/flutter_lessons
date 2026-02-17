import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class AppSettings{

   const AppSettings({
     required this.language,
     required this.fontSize,
     required this.isDarkMode,
   });


  final String language;
  final double fontSize;
  final bool isDarkMode;


  Map<String, dynamic> toMap(){
      return <String, dynamic>{
      'language': language,
      'fontSize': fontSize,
      'isDarkMode': isDarkMode,
    };
  }

    factory AppSettings.fromMap(Map<String, dynamic> map) {
    return AppSettings(
      language: map['language'] as String,
      fontSize: map['fontSize'] as double,
      isDarkMode: map['isDarkMode'] as bool,
    );
  }


  String toJson()=> json.encode(toMap());

    factory AppSettings.fromJson(String source) =>
      AppSettings.fromMap(
                       json.decode(source) as Map<String, dynamic>,
      );

   
}




 
