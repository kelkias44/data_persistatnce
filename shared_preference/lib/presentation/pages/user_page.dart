import 'package:flutter/material.dart';
import 'package:shared_preference/data/data_source/local_data_source.dart';
import 'package:shared_preference/data/model/user_data.dart';
import 'package:shared_preference/data/repository/user_data_repository_impl.dart';
import 'package:shared_preference/domain/repository/user_data_repository.dart';
import 'package:shared_preference/presentation/bloc/bloc/user_data_bloc.dart';

import '../../service_locator.dart';
import '../widgets/birthday_widget.dart';
import '../widgets/button_widget.dart';
import '../widgets/pets_button_widget.dart';




class HomePage extends StatefulWidget {
  
  
  HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  LocalDataStorageImpl localDataStorage = LocalDataStorageImpl();
  UserDataRepositoryImpl? userDataRepositoryImpl;
  final formKey = GlobalKey<FormState>();
  UserData? userData;
  //  String? name = '';
  // DateTime? birthday;
  // List<String> pets = [];

  void initState()async{
    super.initState();     
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: <Widget>[
            const SizedBox(height: 32,),
            buildName(),
            const SizedBox(height: 12,),
            const SizedBox(height: 12,), 

          ],
        )
        ),    
    );

   
  } 
  Widget buildName(){
    return FutureBuilder<UserData>(
      future:  localDataStorage.getUserData(),
      builder: (context,snapshot){
        if(snapshot.hasData){
          return buildTitle(
        title: 'Name',
        child: TextFormField(
          initialValue: snapshot.data!.name,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Your Name',
          ),
          onChanged: (name)=>setState(() {
            snapshot.data!.name = name;
          }),
        )
      );
        }else{
          return const Text('Error to display data');
        }
      },
      
    );
  }
  Widget buildBirthday(){
    return FutureBuilder<UserData>(
      future: localDataStorage.getUserData(),
      builder: (context,snapshot){
        if(snapshot.hasData){
           return BirthdayWidget(
        birthday: snapshot.data!.birthday ?? DateTime.now(),
        onChangedBirthday: (birthday) =>
          setState(()=> snapshot.data!.birthday = birthday),
      );
        }else{
          return const Text('Error to display data');
        }
      },
    );
  }
  Widget buildPet() { 
    return FutureBuilder<UserData>(
      future: localDataStorage.getUserData(),
      builder: (context,snapshot){
        if(snapshot.hasData){
          return buildTitle(
      title: 'Pets',
      child: PetsButtonsWidget(
        pets: snapshot.data!.pets,
        onSelectedPet: (pet) => setState(
          ()=> snapshot.data!.pets.contains(pet)? snapshot.data!.pets.remove(pet) : snapshot.data!.pets.add(pet)
          )
      ));
        }else{
          return const Text('Error to display data');
        }
      },
      
    );}
  Widget buildButton(){
    return ButtonWidget(
      text: 'Save',
      onClicked: () async {
        sl<UserDataBloc>().add(onSettingUserData(UserData(name: userData!.name, birthday: userData!.birthday, pets: userData!.pets)));

        // await userDataRepositoryImpl!.setUserDataRepo(UserData(name: userData!.name, birthday: userData!.birthday, pets: userData!.pets));
      }
    );
  }

  Widget buildTitle({
    required String title,
    required Widget child
  }){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Text(title,style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),),
        const SizedBox(height: 8,),
        child,
      ],
    );    
  }
}