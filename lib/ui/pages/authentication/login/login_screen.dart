import 'package:LatestNest/ui/pages/content/content_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

final nameController = TextEditingController();
final emailController = TextEditingController();
final passwordController = TextEditingController();

//--------------------------------Firebase
final _autenticacion = FirebaseAuth.instance;
//----------------------------------------

class LoginScreen extends StatefulWidget {
  final VoidCallback onViewSwitch;

  const LoginScreen({Key? key, required this.onViewSwitch}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _llaveFormulario = GlobalKey<FormState>();        //Inicialización de la llave

//--------------------------------------------------------------------------------
  late String correo, contrasena, usuario;   //Variables que van a recibir los datos de la firebase
  //FirebaseAuth auth = FirebaseAuth.instance;   //Se crea la instancia de la firebase
//--------------------------------------------------------------------------------
  
  @override
  Widget build(BuildContext context) {
    
    //Vistas de los campos de texto
    //Campo de email
    final emailField = TextFormField(
      autofocus: false,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      // validator: (value){
      //   if(value!.isEmpty){
      //     return ('Ingresa un email');
      //   }
      //   //Expresiones que se usarán para la validación del email
      //   if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)){
      //     return ('Ingresa un correo válido');
      //   }else{
      //     return null;
      //   }
      // },
      onSaved: (value){
        emailController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.mail),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: 'Correo',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      )
    );

    //Campo de password
    final passwordField = TextFormField(
      autofocus: false,
      controller: passwordController,
      obscureText: true,
      // validator: (value){
      //   RegExp regex = RegExp(r'^.{6,}$');       //Número de carácteres que se requieren para el password
      //   if(value!.isEmpty){
      //     return ("Debes ingresar el password");
      //   }
      //   if(!regex.hasMatch(value)){
      //     return ("El password debe contener al menos 6 caracteres");
      //   }
      //   _llaveFormulario.currentState!.save();
      // },
      onSaved: (value){
        passwordController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.vpn_key),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: 'Contraseña',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      )
    );

    //Botón de loggin
    final botonLogueo = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.redAccent,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          //signIn(emailController.text, passwordController.text);
          //Get.offNamed('/content');     //Acceder al Home
          signIn(emailController.text, passwordController.text);
        },
        child: const Text(
          'Ingresar',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: (15), color: Colors.white, fontWeight: FontWeight.bold),
        )
      ),
    );

    return Padding(
      padding: const EdgeInsets.all(10.0),      //Ancho de los laterales del contenedor de elementos
      key: _llaveFormulario,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          const SizedBox(height: 20),

          Text(
            "LatestNest",
            style: Theme.of(context).textTheme.headline6,
          ),

          //Caja de espacio entre el título y los textbox
          const SizedBox(height: 20),

          Text(
            "La red social para comunicadores sociales.",
            style: Theme.of(context).textTheme.headline6, textScaleFactor: 0.7,
          ),

          //const Spacer(),             Espaciador grande
          
          const SizedBox(height: 40),

          Padding(
            padding: const EdgeInsets.all(0.5),
            child: Text(
              "Iniciar sesión",
              style: Theme.of(context).textTheme.headline1,
            ),
          ),

          const SizedBox(height: 20),

          emailField,         //Caja del email

          const SizedBox(height: 10),

          passwordField,      //Caja del password
          
          const SizedBox(height: 20),

          botonLogueo,        //Enlace para registro

          const SizedBox(height: 20),

          const Text('¿No tienes cuenta?'),

          TextButton(
              onPressed: widget.onViewSwitch, child: const Text("Regístrate")),
          const Spacer(),
        ],
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

            //Validador de los campos de email y password, falta por corregir
  void signIn(String email, String password) async {
    if(emailController.text.isNotEmpty){       //Acá va el resultado de las validaciones de las cajas de texto (están deshabilitadas)
      await _autenticacion.signInWithEmailAndPassword(email: email, password: password)
      .then((uid) => {
        Fluttertoast.showToast(msg: 'Un gusto saludarte ${email}'),
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const ContentPage())),
        print('Datos cumplen'),
      }).catchError((e){
        Fluttertoast.showToast(msg: e);
        print(password);
      });
      print(password);
    }
  }
}
