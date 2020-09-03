import 'package:flutter/material.dart';
import 'package:notepad/models/note.dart';
import 'package:notepad/main.dart';
//import 'package:notepad/widgets/note_list.dart';

class Note_editor extends StatelessWidget {
  final Note note;

  const Note_editor({Key key, this.note}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: TextField(
          controller: TextEditingController(text: note.Text_in_note()),
          maxLines: null,
        ),
        appBar: AppBar(title: Text("uzrasas"), actions: <Widget>[
          FlatButton(
            onPressed: () => update_user_information(),
            child: Text("Save"),
          )
        ]));
  }

  void update_user_information() {
    print("bandau issaugoti");
    ///TODO: cia reikia pakeisti note reiksme
    UserInformation().save(note.id, note);
    //noteList.update(note.id);
  }
}

////cia turesiu issaugoti
