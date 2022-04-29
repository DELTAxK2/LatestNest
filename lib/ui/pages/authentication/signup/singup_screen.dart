import 'package:LatestNest/model/user_model.dart';
import 'package:LatestNest/ui/pages/content/content_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/route_manager.dart';

class SignUpScreen extends StatefulWidget {
  final VoidCallback onViewSwitch;

  const SignUpScreen({Key? key, required this.onViewSwitch}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<SignUpScreen> {

  final _llaveFormulario = GlobalKey<FormState> ();
  final _autenticacion = FirebaseAuth.instance;

  final nameController = TextEditingController();
  final userController = TextEditingController();
  final emailRegisterController = TextEditingController();
  final passwordRegisterController = TextEditingController();
  final rePasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final nameField = TextFormField(
      autofocus: false,
      controller: nameController,
      keyboardType: TextInputType.name,
      onSaved: (value){
        nameController.text = value!;
      },
      textInputAction: TextInputAction.next,          //Icono del teclado abajo a la derechan (check o next)
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.account_circle),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: 'Nombre Completo',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      )
    );

    final userilField = TextFormField(
      autofocus: false,
      controller: userController,
      keyboardType: TextInputType.name,
      onSaved: (value){
        userController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.social_distance_rounded),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: 'Nombre Para Mostrar',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      )
    );

    final emaiRegisterlField = TextFormField(
      autofocus: false,
      controller: emailRegisterController,
      keyboardType: TextInputType.emailAddress,
      onSaved: (value){
        emailRegisterController.text = value!;
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

    final passwordRegisterlField = TextFormField(
      autofocus: false,
      controller: passwordRegisterController,
      //obscuringCharacter: "*",
      obscureText: true,
      onSaved: (value){
        passwordRegisterController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.vpn_key),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: 'Contraseña',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      )
    );

    final rePasswordField = TextFormField(
      autofocus: false,
      controller: rePasswordController,
      obscureText: true,
      onSaved: (value){
        rePasswordController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.vpn_key),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: 'Repite la Contraseña',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      )
    );

    final botonRegistro = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.redAccent,
      child: MaterialButton(
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () async {
          //Get.offNamed('/content');     //Acceder al Home
          signUp(emailRegisterController.text, passwordRegisterController.text);
        },
        child: const Text(
          'Registrar',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: (15), color: Colors.white, fontWeight: FontWeight.bold),
        )
      ),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.red),
          onPressed: widget.onViewSwitch,
          // onPressed: () {
          //   Navigator.of(context).pop();
          // },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
      
            const Spacer(),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Registrarse",
                style: Theme.of(context).textTheme.headline1,
              ),
            ),

            const SizedBox(height: 20),
            nameField,
            const SizedBox(height: 10),
            userilField,
            const SizedBox(height: 10),
            emaiRegisterlField,
            const SizedBox(height: 10),
            passwordRegisterlField,
            const SizedBox(height: 10),
            rePasswordField,
            const SizedBox(height: 20),
            botonRegistro,

            const Spacer(),
            const Spacer(),
            const Spacer(),
            const Spacer(),
            const Spacer(),
            const Spacer(),
            const Spacer(),
          ],
        ),
      )
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    emailRegisterController.dispose();
    passwordRegisterController.dispose();
    rePasswordController.dispose();
    userController.dispose();
    super.dispose();
  }

  postDetailsToFirestore() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _autenticacion.currentUser;

    UserModel userModel = UserModel();
    //Escribir los valores
    userModel.correoL = user!.email;
    userModel.uidL = user.uid;
    userModel.n_amigosL = '3';
    userModel.nombreL = nameController.text;
    userModel.passwordL = passwordRegisterController.text;
    userModel.usuarioL = userController.text;

    await firebaseFirestore.collection('users').doc(user.uid).set(userModel.toMap());
    Fluttertoast.showToast(msg:'Cuenta creada con éxito =) ${userController.text}');
    Navigator.pushAndRemoveUntil(
      (context),
      MaterialPageRoute(builder: (context) => ContentPage()),
      (routes) => false);
  }

  void signUp(String email, String password) async {
    if(nameController.text.isNotEmpty) {          //Acá va el resultado de las validaciones de los campos
      await _autenticacion.createUserWithEmailAndPassword(email: email, password: password)
    .then((value) =>{
      postDetailsToFirestore()
    }).catchError((e){
      Fluttertoast.showToast(msg: e);
    });
    }
  }
}
