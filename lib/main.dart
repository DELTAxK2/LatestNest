import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'ui/app.dart';
import 'controllers/contenido/add_person_controller.dart';
import 'controllers/contenido/delete_person_controller.dart';

Future firebaseCorreo() async {
  final correo = await FirebaseAuth.instance.currentUser!.email;
  return correo;
}

Future <void> main() async {

  WidgetsFlutterBinding.ensureInitialized();  //Inicializar las dependencias de flutter para la firebase
  await Firebase.initializeApp();
  runApp(const App());
  Get.put(AddPersonController());
  Get.put(DeletePersonController());
  
  //Barra de estado 
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.light,
  ));

}
