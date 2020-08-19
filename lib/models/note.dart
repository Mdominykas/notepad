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

  String buildTitle(BuildContext context)
  {
      return id.toString();
  }

}