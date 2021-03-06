import 'package:flutter/material.dart';
import 'package:notepad/models/UserInformation.dart';
import 'package:notepad/models/note.dart';
import 'package:notepad/routes.dart';

class NoteList extends StatefulWidget {
  @override
  _NoteListState createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  List<Note> notes;


  Widget build(BuildContext context) {
    // Read notes
    return FutureBuilder(
      future: UserInformation.instance.getAllNotes(),
      builder: (BuildContext context, AsyncSnapshot<List<Note>> snapshot) {
        if (snapshot.hasData &&
            snapshot.connectionState == ConnectionState.done) {
          notes = snapshot.data;

          return ListView.builder(
            itemCount: notes.length,
            itemBuilder: (context, index) {
              final item = notes[index];

              return ListTile(
                  title: Text(item.buildTitle(context)),
                  subtitle: Text(item.summaryOfText()),
                  onTap: () => onNoteCreateTap(item));
            },
          );
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }
        return CircularProgressIndicator();
      },
    );
  }

  Future<void> onNoteCreateTap(Note note) async {
    await Navigator.pushNamed(context, Routes.ROUTE_NOTE_EDITOR,
        arguments: note);

    setState(() {});
  }
}
