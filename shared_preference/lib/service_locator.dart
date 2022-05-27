import 'package:get_it/get_it.dart';
import 'package:shared_preference/data/data_source/local_data_source.dart';
import 'package:shared_preference/data/repository/user_data_repository_impl.dart';
import 'package:shared_preference/domain/repository/user_data_repository.dart';
import 'package:shared_preference/presentation/bloc/bloc/user_data_bloc.dart';

final sl = GetIt.instance;

Future initServiceLocator()async{
  sl.registerFactory<UserDataBloc>(() => UserDataBloc(sl()));
  sl.registerSingleton(() => UserDataRepositoryImpl(sl()));
  sl.registerSingleton<LocalDataStorage>(LocalDataStorageImpl());

    
}