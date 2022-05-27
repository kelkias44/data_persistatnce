part of 'user_data_bloc.dart';

@immutable
abstract class UserDataEvent extends Equatable{}

class onLoadingUserData extends UserDataEvent{
  @override
  List<Object?> get props => [];
}
class onSettingUserData extends UserDataEvent{
  final UserData userData;

  onSettingUserData(this.userData);
  @override
  List<Object?> get props => [userData];
}


