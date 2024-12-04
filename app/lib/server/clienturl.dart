import 'package:firebase_database/firebase_database.dart';
class ClientUrl{
    DatabaseReference ref = FirebaseDatabase.instance.ref("test");
    Future<void> changeClock(int val) async {
      try {
        await ref.update({
          "clock": val.toInt(),
          "text": "",
          "data": val.toInt(),
        });
      } catch (e) {
        print(e.toString());
        rethrow;
      }
    }
    Future<void> changeText(String val) async {
      try {
        await ref.set({
          "text": val.toString(),
          "clock": 4.toInt(),
          "data": val.toString(),
        });
      } catch (e) {
        print(e.toString());
        rethrow;
      }
    }
}