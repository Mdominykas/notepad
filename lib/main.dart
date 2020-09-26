import 'package:flutter/material.dart';
import 'package:notepad/models/note.dart';
import 'package:notepad/routes.dart';
import 'package:notepad/tabs/HomePageTab.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    UserInformation().createDummyData();

    ///sita veliau istrinti
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Notepad (name subject to change)'),
      onGenerateRoute: Routes.onGenerateRoute,
    );
  }
}

class UserInformation {
  void save(int id, Note note) async {
    final prefs = await SharedPreferences.getInstance();
    id++;
    prefs.setString(id.toString(), note.Text_in_note());
    final ans = prefs.getString(id.toString());
    print(ans);
  }

  void saveNumberOfNotes(int num) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('0', num);
  }

  Future<String> read(int id) async {
    final prefs = await SharedPreferences.getInstance();
    id++;
    final ans = prefs.getString(id.toString()) ?? '';
    return ans;
  }

  createDummyData() async {
    List<Note> notes = [
      Note(0, "pirmas1234"),
      Note(1, "antras"),
      Note(2,
          "ilgas ilgas ilgas ilgas ilgas ilgas ilgas ilgas ilgas pavadinimas"),
    ];

    for (final note in notes) {
      save(note.id, note);
    }
    saveNumberOfNotes(notes.length);

    //final prefs = await SharedPreferences.getInstance();
  }

  Future<int> getEmptyId() async {
    final prefs = await SharedPreferences.getInstance();
    int kiekis = prefs.getInt('0');
    for (int i = 1; i <= kiekis + 1; i++) {
      String sitas = prefs.getString(i.toString()) ?? '';
      if(sitas=='')
        return i;
    }
    return kiekis+2;
  }

  Future<int> getNumberOfNotes() async{
    final prefs = await SharedPreferences.getInstance();
    int kiekis = prefs.getInt('0');
    return kiekis;
  }

  Future<List<Note>> getAllNotes() async {
    //createDummyData();

    final prefs = await SharedPreferences.getInstance();

    final int kiekis = prefs.getInt('0') ?? '3';
    List<Note> ans = List<Note>();
    for (int i = 1; i <= kiekis; i++) {
      Note createdNote = Note(i - 1, prefs.getString(i.toString()) ?? '');
      ans.add(createdNote);
    }
    print(ans.length);
    return ans;
  }
}
