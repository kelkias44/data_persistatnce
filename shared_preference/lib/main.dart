import 'package:flutter/material.dart';
import 'package:shared_preference/data/data_source/local_data_source.dart';
import 'package:shared_preference/presentation/bloc/bloc/user_data_bloc.dart';
import 'package:shared_preference/service_locator.dart';

import 'presentation/pages/user_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalDataStorageImpl().init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserDataBloc>(
      create: (_) => sl<UserDataBloc>(),
      child: MaterialApp(
        title: 'shared_preference',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
      ),
    );
  }
}
