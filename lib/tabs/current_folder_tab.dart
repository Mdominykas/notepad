import 'package:notepad/widgets/note_list.dart';
import 'package:flutter/material.dart';

class CurrentFolderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("sdfsdfasdasdgfasdgasdg"),
      ),
      body: Container(child: CurrentFolderTabBody()),
    );
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
