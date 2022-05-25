import 'package:shared_preference/data/model/user_data.dart';

abstract class UserDataRepository{
  Future<UserData> getUserDataRepo();
  Future setUserDataRepo(UserData userData);
}