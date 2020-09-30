import 'package:notepad/models/note.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserInformation {
  void save(int id, Note note) async {
    print("savinu");
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(id.toString(), note.textInNote());
    final ans = prefs.getString(id.toString());
    print(ans);
  }

  clearNote(int id) async {
    print("clearinuNotes");
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(id.toString(), "");
  }

  void saveNumberOfNotes(int num) async {
    print("savinuNumberOfNotes");
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt("numberOfNotes", num);
    final maxIdOfNotes = await getMaxIdOfNotes();
    if (num > maxIdOfNotes) {
      setMaxIdOfNotes(num);
    }
  }

  Future<String> read(int id) async {
    print("readinu");
    final prefs = await SharedPreferences.getInstance();
    final ans = prefs.getString(id.toString()) ?? '';
    return ans;
  }


  void createDummyData() async {
    print("creatinuDummiuData");
    List<Note> notes = [
      Note(0, "pirmas1234"),
      Note(1, "antras"),
      Note(2,
          "ilgas ilgas ilgas ilgas ilgas ilgas ilgas ilgas ilgas pavadinimas"),
    ];
    int idsFromLastime = await getMaxIdOfNotes();
    for (int i = 0; i <= idsFromLastime; i++) {
      clearNote(i);
    }

    for (final note in notes) {
      save(note.id, note);
    }
    saveNumberOfNotes(notes.length);

    //final prefs = await SharedPreferences.getInstance();
  }

  Future<int> getEmptyId() async {
    print("getinuTusciaId");
    int rez = await getMaxIdOfNotes();
    return rez + 1;
  }

  Future<int> getNumberOfNotes() async {
    print("getinuNumberOfNotes");
    final prefs = await SharedPreferences.getInstance();
    int kiekis = prefs.getInt("numberOfNotes") ?? 0;
    return kiekis;
  }

  void deleteEmptyNotesInEnd() async {
    final prefs = await SharedPreferences.getInstance();
    int didziausias = prefs.getInt("maxIdOfNotes") ?? 0;
    String paskutinisTekstas = prefs.getString(didziausias.toString());
    while ((didziausias != 0) && (paskutinisTekstas == "")) {
      didziausias--;
      paskutinisTekstas = prefs.getString(didziausias.toString());
    }
    setMaxIdOfNotes(didziausias);
  }

  Future<int> getMaxIdOfNotes() async {
    print("getinuMaxIDOfNotes");
    final prefs = await SharedPreferences.getInstance();
    int maxIdOfNotes = prefs.getInt("maxIdOfNotes") ?? 0;
    print("pagetinauMaxIdOfNotes");
    return maxIdOfNotes;
  }

  void setMaxIdOfNotes(int maxIdOfNotes) async {
    print("setinuMaxID");
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt("maxIdOfNotes", maxIdOfNotes);
  }

  Future<List<Note>> getAllNotes() async {
    //createDummyData();
    print("getinuAllNotes");
    final prefs = await SharedPreferences.getInstance();

    int kiekis = await getNumberOfNotes();
    List<Note> ans = List<Note>();
    for (int i = 0; i < kiekis; i++) {
      Note createdNote = Note(i, prefs.getString(i.toString()) ?? '');
      ans.add(createdNote);
    }
    print(ans.length);
    return ans;
  }
}
