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
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      onGenerateRoute: Routes.onGenerateRoute,
    );
  }
}

class UserInformation {
  void save(int id, Note note) async {
    print("ar as save");
    final prefs = await SharedPreferences.getInstance();
    id++;
    prefs.setString(id.toString(), note.Text_in_note());

    print("kai as bandau saugoti");
    print(note.id);
    print(note.text);
  }

  Future<String> read(int id) async {
    print("ar as read");
    final prefs = await SharedPreferences.getInstance();
    id++;
    final ans = prefs.getString(id.toString()) ?? '';
    await ans;
    return ans;
  }

  /*void getAllNotes() async
  {
    final prefs = await SharedPreferences.getInstance();
    final int kiekis = prefs.getInt('0') ?? '0';
    List<Note> ans;
    for (int i = 1; i <= kiekis; i++) {
      ans.Add(Note(i - 1, prefs.getString(i.toString()) ?? ''));
    }
    //return ans;
  }*/

  createDummyData()  async {
    print("ar as createDummyData");
    List<Note> notes = [
      Note(0, "pirmas1234"),
      Note(1, "antras"),
      Note(2,
          "ilgas ilgas ilgas ilgas ilgas ilgas ilgas ilgas ilgas pavadinimas"),
    ];

    for (final note in notes) {
      save(note.id, note);
    }

    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('0', notes.length);

  }

  Future<List<Note>> getAllNotes() async {
    createDummyData();


    final prefs = await SharedPreferences.getInstance();

    print("ar as getAllNotes");
    final int kiekis = prefs.getInt('0') ?? '3';
    List<Note> ans;
    for (int i = 1; i <= kiekis; i++) {
      print("isidedu toki");
      print(prefs.getString(i.toString() ?? ''));
      print(i-1);
      final Note createdNote =  Note(i - 1, prefs.getString(i.toString()) ?? '');
      ans.add(createdNote);
    }
    return ans;
  }
}
