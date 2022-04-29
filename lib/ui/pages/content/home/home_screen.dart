import 'package:LatestNest/controllers/contenido/add_person_controller.dart';
import 'package:flutter/material.dart';
import 'widgets/home_card.dart';
import 'package:get/get.dart';

class HomeOffersScreen extends StatefulWidget {
  // HomeOffersScreen empty constructor
  const HomeOffersScreen({Key? key}) : super(key: key);

  @override
  _State createState() => _State();
}

  final controladorAmigos = Get.put(AddPersonController());
  int contadorAmg = controladorAmigos.contadorF.value;

class _State extends State<HomeOffersScreen> {
  final items = List<String>.generate(contadorAmg, (j) => "Item $j");
  
  @override
  Widget build(BuildContext context) {
    return GetX<AddPersonController>(
      // cuerpo de la página Estado (en la App)
      builder: (controller) {
        return Expanded(
          child: ListView.builder(
            itemCount: controller.contadorF.value, // cuantas cards se van a mostrar
            itemBuilder: (context, index) {         // itemBuilder actúa como un for
              return PostCard(
                title: 'Usuario',
                content:
                    'Je vais juste lui faire des signes de tête en signant rapidement et faire des mots au hasard',
                picUrl:
                    'https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50?s=200',
                onChat: () => {},
              );
            }
          ),
        );
      }
    );
  }
}