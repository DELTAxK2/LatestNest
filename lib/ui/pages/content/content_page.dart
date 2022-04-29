import 'package:LatestNest/controllers/contenido/title_name_controller.dart';
import 'package:LatestNest/model/user_model.dart';
import 'package:LatestNest/ui/pages/authentication/login/login_screen.dart';
import 'package:LatestNest/ui/widgets/appbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'location/location_screen.dart';
import 'general_publications/general_publications_screen.dart';
import 'messages/messages_screen.dart';
import 'persons_publications/persons_publications_screen.dart';
import 'package:get/get.dart';
import 'home/home_screen.dart';

class ContentPage extends StatefulWidget {
  const ContentPage({Key? key}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<ContentPage> {

  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState(){
    super.initState();
    FirebaseFirestore.instance
    .collection('users')
    .doc(user!.uid)
    .get()
    .then((value){
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });

//----------------------------------------------
  //Traer la data desde la firebase
  // @override
  // void initState(){
  //   super.initState();
    //getUsers();     //Llamado a la función de abajo
  }

  // void getUsers() async {   //Función asíncrona ya que trae info de internet
  //   //Nombre de la colección en firebase
  //   CollectionReference coleccionUsers = FirebaseFirestore.instance.collection("users");
    
  //   //Se realiza una consulta a esa base y se almacena el la variable "users"
  //   QuerySnapshot users = await coleccionUsers.get();   //Se coloca el "await" para esperar a que se resuelva la traída de datos

  //   //La propiedad "docs" trae los datos como un array
  //   //Se verifica si hay datos guardados
  //   if(users.docs.isNotEmpty) {
  //     for (var doc in users.docs) {   //Recorrer cada valor "docs" almacenado en users
  //       print(doc.data());            //Imprimir la propiedad "data"
  //     }
  //   }
  // }
//----------------------------------------------

  final controladorTitulo = Get.put(ControladorTitulo());
  int _selectedIndex = 0;
  Widget _content = const HomeOffersScreen();     //Página inicial que se carga después del login

  // NavBar action
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      switch (_selectedIndex) {
        case 0:
          //Social de amigos
          _content = const HomeOffersScreen();
          //controladorTitulo.tituloGeneral.value = ('${loggedInUser.nombreL} ${loggedInUser.usuarioL}');   //Usar los datos de la Firebase
          controladorTitulo.tituloGeneral.value = ("Inicio");
          break;
        case 1:
          //Social general
          _content = const UsersOffersScreen();
          controladorTitulo.tituloGeneral.value = ("Social");
          break;
        case 2:
          //Ofertas publicas
          _content = const PublicOffersScreen();
          controladorTitulo.tituloGeneral.value = ("Ofertas y Eventos");
          break;
        case 3:
          //Ubicaciones
          _content = const LocationScreen();
          controladorTitulo.tituloGeneral.value = ("Ubicación");
          break;
        case 4:
          //Mensajes
          _content = const StatesScreen();
          controladorTitulo.tituloGeneral.value = ("Mensajes");
          break;
        default:
          //Home
          _content = const HomeOffersScreen();
          controladorTitulo.tituloGeneral.value = ("Inicio");
      }
    });
  }

  // We create a Scaffold that is used for all the content pages
  // We only define one AppBar, and one scaffold.
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      //Barra superior de la App
      appBar: CustomAppBar(
        picUrl: 'https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50?s=200',
        tile: Obx(() => Text(controladorTitulo.tituloGeneral.value)),            //Título de la barra principal modificado por el controlador
        context: context,
        onSignOff: () {
          Get.offNamed('/auth');
        },
      ),

      //Contenido del cuerpo de la App (no los botones de navegación inferiores)

      body: Center(   //Safearea(
        child: Padding(
          // child: Padding(
          //   padding: const EdgeInsets.all(20),
          //   child: Column(
          //     mainAxisAlignment : MainAxisAlignment.center,
          //     crossAxisAlignment: CrossAxisAlignment.center,
          //     children: const <Widget>[
          //       SizedBox(height:10,),
          //       Text('Email', style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w500,)
          //       )],
          //   ),
          // ),
          padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            child: _content,                      //Llamado a la lista de objetos que hay en home_screen.dart
          ),
        ),
      ),
      
      // Botones de navegación inferiores
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group_outlined),
            label: 'Social',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.public_outlined),
            label: 'Eventos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.place_outlined),
            label: 'Ubicación',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            label: 'Mensajes',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  Future <void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => LoginScreen(onViewSwitch: () {},)));
  }
}
