import 'package:flutter/material.dart';
import 'package:shared_preference/data/model/user_data.dart';
import 'package:shared_preference/data/repository/user_data_repository_impl.dart';
import 'package:shared_preference/domain/repository/user_data_repository.dart';

import '../widgets/birthday_widget.dart';
import '../widgets/button_widget.dart';
import '../widgets/pets_button_widget.dart';




class HomePage extends StatefulWidget {
  
  HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late UserDataRepositoryImpl userDataRepositoryImpl;
  final formKey = GlobalKey<FormState>();
  UserData? userData;
  //  String? name = '';
  // DateTime? birthday;
  // List<String> pets = [];

  void initState()async{
    super.initState();

    userData = await userDataRepositoryImpl.getUserDataRepo(); 
    
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
          ],
        )
        ),      
    );

   
  } 
  Widget buildName(){
    return buildTitle(
      title: 'Name',
      child: TextFormField(
        initialValue: userData!.name,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Your Name',
        ),
        onChanged: (name)=>setState(() {
          this.userData!.name = name;
        }),
      )
    );
  }
  Widget buildBirthday(){
    return BirthdayWidget(
      birthday: userData!.birthday ?? DateTime.now(),
      onChangedBirthday: (birthday) =>
        setState(()=> this.userData!.birthday = birthday),
    );
  }
  Widget buildPet() => buildTitle(
    title: 'Pets',
    child: PetsButtonsWidget(
      pets: userData!.pets,
      onSelectedPet: (pet) => setState(
        ()=> userData!.pets.contains(pet)? userData!.pets.remove(pet) : userData!.pets.add(pet)
        )
    ));
  Widget buildButton(){
    return ButtonWidget(
      text: 'Save',
      onClicked: () async {
        await userDataRepositoryImpl.setUserDataRepo(UserData(name: userData!.name, birthday: userData!.birthday, pets: userData!.pets));
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