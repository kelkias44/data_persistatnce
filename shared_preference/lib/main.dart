import 'package:flutter/material.dart';
import 'package:shared_preference/data/data_source/local_data_source.dart';

import 'presentation/pages/user_page.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalDataStorageImpl().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'shared_preference',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}




