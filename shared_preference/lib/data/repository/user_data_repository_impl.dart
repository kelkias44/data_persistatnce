import 'package:shared_preference/data/data_source/local_data_source.dart';
import 'package:shared_preference/data/model/user_data.dart';
import 'package:shared_preference/domain/repository/user_data_repository.dart';



class UserDataRepositoryImpl implements UserDataRepository{
  final LocalDataStorage localDataStorage;

  UserDataRepositoryImpl(this.localDataStorage); 
  @override
  Future<UserData> getUserDataRepo()async {
    return localDataStorage.getUserData();    
  }

  @override
  Future setUserDataRepo(UserData userData) async {
    localDataStorage.setUserData(userData);
  }
}