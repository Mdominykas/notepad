import 'package:notepad/main.dart';
import 'package:notepad/models/note.dart';
import 'package:notepad/routes.dart';
import 'package:notepad/widgets/note_list.dart';
import 'package:flutter/material.dart';

class CurrentFolderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("esate folderyje"),
        automaticallyImplyLeading: false,

        ///nuima rodiklyte
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: ()  => createNewNote(context),
              child: Icon(
                Icons.add,
                size: 26.0,
              ),
            ),
          ),
        ],
      ),
      body: Container(child: CurrentFolderTabBody()),
    );
  }

  void createNewNote(BuildContext context) async
  {
    int emptyId = await UserInformation().getEmptyId();
    Note note = Note(emptyId, "ha sukuriau nauja");
    UserInformation().save(emptyId, note);
    Navigator.pushNamed(context, Routes.ROUTE_NOTE_EDITOR,
        arguments: note);
    int numberOfNotes = await UserInformation().getNumberOfNotes();
    numberOfNotes++;
    UserInformation().saveNumberOfNotes(numberOfNotes);
  }
}

class CurrentFolderTabBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: NoteList(),
    );
  }
}