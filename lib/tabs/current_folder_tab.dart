import 'package:notepad/widgets/note_list.dart';
import 'package:flutter/material.dart';

class CurrentFolderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("sdfsdfasdasdgfasdgasdg"),
        automaticallyImplyLeading: false,

        ///nuima rodiklyte
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () => createNewNote(),
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
}

class CurrentFolderTabBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: NoteList(),
    );
  }
}

void createNewNote()
{

}
///failai su underscorais is mazuju
///klase is didziosios su CamelCase
///property is mazosios us didziosiomis toliau
