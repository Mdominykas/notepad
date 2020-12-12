import 'package:flutter/material.dart';

final String tableNotes = 'notes';
final String columnText = 'text';
final String columnId = '_id';


class Note{
  int id = 3;

  String text = "";

  //Note();

  Note(int id, String text)
  {
    this.id = id;
    this.text = text;
  }

  Note.fromMap(Map<String, dynamic> map)
  {
    id = map[columnId];
    text = map[columnText];
  }


  Map<String, dynamic> toMap()
  {
    var map = <String, dynamic>{
      columnText: text
    };
    if(id!=null) {
      map[columnId] = id;
    }
    return map;
  }

  String textInNote()
  {
    return text;
  }

  String summaryOfText()
  {
    if(text.length<20)
      return text;
    else
      return text.substring(0, 20)+"...";///ne hardcodint
  }

  String buildTitle(BuildContext context)
  {
      return id.toString();
  }

}