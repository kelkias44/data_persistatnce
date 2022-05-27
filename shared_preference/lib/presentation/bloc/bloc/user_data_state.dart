part of 'user_data_bloc.dart';

@immutable
abstract class UserDataState extends Equatable{}

class UserDataInitial extends UserDataState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class LoadingUserData extends UserDataState{
  @override
  List<Object?> get props => [];
}
class LoadedUserData extends UserDataState{
  final UserData _userData;

  LoadedUserData(this._userData);
  @override
  List<Object?> get props => [_userData];
  
}

class ErrorUserData extends UserDataState{
  @override
  List<Object?> get props => [];
}
