import 'package:get_it/get_it.dart';

import '../data_source/local/local_data_source.dart';
import '../data_source/remote/remote_data_source.dart';
import '../repository/user_repository.dart';

final getIt = GetIt.instance;

userModule(){
  //lazy singleton doesn't create object until we don't run it
  getIt.registerLazySingleton<LocalDataSource>(() => LocalDataSource());

  getIt.registerLazySingleton<RemoteDataSource>(() => RemoteDataSource());

  getIt.registerLazySingleton<UserRepository>(() => UserRepository(
    localDataSource: getIt(), 
    remoteDataSource: getIt(),
  ));
}