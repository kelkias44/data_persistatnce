import 'package:shared_preference/data/model/user_data.dart';
import 'package:shared_preferences/shared_preferences.dart';
abstract class LocalDataStorage{
  Future<UserData>getUserData();
  Future setUserData(UserData userData);
}


class LocalDataStorageImpl implements LocalDataStorage{
  SharedPreferences? _preferences;
  String _keyUsername = 'Username';
  String _keyPets = 'pets';
  String _keyBirthday = 'birthday';

  Future init() async =>
   _preferences = await SharedPreferences.getInstance();

  Future<UserData> getUserData()async{
    final birthday = _preferences!.getString(_keyBirthday);
    return UserData(
      name: _preferences!.getString(_keyUsername)!,
      birthday: birthday == null ? null : DateTime.tryParse(birthday),
      pets: _preferences!.getStringList(_keyPets)!,
      );
  }
  Future setUserData(UserData userData)async{
    final birthday = userData.birthday!.toIso8601String();
    await _preferences!.setString(_keyUsername, userData.name);
    await _preferences!.setString(_keyBirthday, birthday);
    await _preferences!.setStringList(_keyPets, userData.pets);
  }

 
  }


  

//   static  Future setUsername(String username) async =>
//    await _preferences!.setString(_keyUsername, username);
//   static String? getUsername() => _preferences!.getString(_keyUsername);

//   static Future setPets(List<String> pets) async =>
//       await _preferences!.setStringList(_keyPets, pets);

//   static List<String>? getPets() => _preferences!.getStringList(_keyPets);

//   static Future setBirthday(DateTime dateOfBirth) async {
//     final birthday = dateOfBirth.toIso8601String();

//     return await _preferences!.setString(_keyBirthday, birthday);
//   }

//   static DateTime? getBirthday() {
//     final birthday = _preferences!.getString(_keyBirthday);

//     return birthday == null ? null : DateTime.tryParse(birthday);
//   }
// }