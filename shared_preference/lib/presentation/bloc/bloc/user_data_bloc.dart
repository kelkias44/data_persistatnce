import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'package:shared_preference/data/model/user_data.dart';
import 'package:shared_preference/data/repository/user_data_repository_impl.dart';

import '../../../domain/repository/user_data_repository.dart';

part 'user_data_event.dart';
part 'user_data_state.dart';

class UserDataBloc extends Bloc<UserDataEvent, UserDataState> {
  UserDataRepository userDataRepository;
  UserDataBloc(
    this.userDataRepository,
  ) : super(UserDataInitial()) {
    on<UserDataEvent>((event, emit) async {
      if(event is onLoadingUserData){
        emit(LoadingUserData());
        final data = await userDataRepository.getUserDataRepo();
        emit(LoadedUserData(data));
      }else if(event is onSettingUserData){
        userDataRepository.setUserDataRepo(event.userData);
    }});
  }
}
