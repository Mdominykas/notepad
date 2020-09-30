import 'package:flutter/material.dart';
import 'package:notepad/models/note.dart';
import 'package:notepad/tabs/current_folder_tab.dart';
import 'package:notepad/widgets/note_editor.dart';

class Routes {
  static const ROUTE_FOLDER_TAB = "current_folder_tab";
  static const ROUTE_NOTE_EDITOR = "note_editor";

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    print("Route to $settings.name");
    switch (settings.name) {
      case ROUTE_FOLDER_TAB:
        return MaterialPageRoute(builder: (context) {
          return CurrentFolderPage();
        });
      case ROUTE_NOTE_EDITOR:
        return MaterialPageRoute(builder: (context) {
          final Note thisNote = settings.arguments;
//          final NoteList thisNoteList = settings.arguments;
          return NoteEditor(
            note: thisNote,
//            noteList: thisNoteList,
          );
        });

      default:
        throw Exception("Unable to go there");
    }
  }
}
