import 'package:flutter/material.dart';
import 'package:notepad/models/UserInformation.dart';
import 'package:notepad/models/note.dart';
import 'package:notepad/routes.dart';

class NoteEditor extends StatelessWidget {
  final Note note;

  const NoteEditor({Key key, this.note}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: TextField(
          controller: TextEditingController(text: note.textInNote()),///galima sita greitu padaryti
          onChanged: (text){
            note.text = text;
          },
          maxLines: null,
        ),
        appBar: AppBar(title: Text("uzrasas"), actions: <Widget>[
          FlatButton(
            onPressed: () => updateUserInformation(note.text, context),
            child: Text("Save"),
          )
        ]));
  }

  void updateUserInformation(String tekstas, BuildContext context) {
    print("bandau issaugoti");
    note.text = tekstas;
    UserInformation().save(note.id, note);
    Navigator.pushNamed(context, Routes.ROUTE_FOLDER_TAB);
  }
}