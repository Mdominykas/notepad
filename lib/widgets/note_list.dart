import 'package:flutter/material.dart';
import 'package:notepad/models/note.dart';

class NoteList extends StatefulWidget {
  @override
  _NoteListState createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  static final List<Note> notes = [
    Note(0, "pirmas1234"),
    Note(1, "antras"),
    Note(2, "ilgas ilgas ilgas ilgas ilgas ilgas ilgas ilgas ilgas pavadinimas"),
  ];

  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: notes.length,
      itemBuilder: (context, index) {
        final item = notes[index];

        return ListTile(
          title: Text(item.buildTitle(context)),
          subtitle: Text(item.Text_in_note()),
        );
      },
    );
  }
}
