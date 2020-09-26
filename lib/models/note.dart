import 'package:flutter/material.dart';

class Note{
  int id = 3;

  String text = "";

  Note(int id, String text)
  {
    this.id = id;
    this.text = text;
  }

  String Text_in_note()
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