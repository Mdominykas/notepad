import 'package:flutter/material.dart';
import 'package:notepad/models/note.dart';
import 'package:notepad/main.dart';

class Note_editor extends StatelessWidget {
  final Note note;

  const Note_editor({Key key, this.note}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: TextField(
          controller: TextEditingController(text: note.Text_in_note()),///galima sita greitu padaryti
          onChanged: (text){
            update_user_information(text);
          },
          maxLines: null,
        ),
        appBar: AppBar(title: Text("uzrasas"), actions: <Widget>[
          FlatButton(
            onPressed: () => update_user_information(note.text),///jis nieko nedaro
            child: Text("Save"),
          )
        ]));
  }

  void update_user_information(String tekstas) {
    print("bandau issaugoti");
    note.text = tekstas;
    UserInformation().save(note.id, note);
    //noteList.update(note.id);
  }
}