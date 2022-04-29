import 'package:LatestNest/controllers/contenido/add_person_controller.dart';
import 'package:LatestNest/controllers/contenido/delete_person_controller.dart';
import 'package:LatestNest/ui/widgets/card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class PostCard extends StatelessWidget {
  final String title, content, picUrl;
  final VoidCallback onChat;

  // PostCard constructor
  PostCard(
      {Key? key,
      required this.title,
      required this.content,
      required this.picUrl,
      required this.onChat,})
      : super(key: key);
      
  final controladorAmigos = Get.put(AddPersonController());
  final controladorEliminarAmigos = Get.put(DeletePersonController());

  // We create a Stateless widget that contais an AppCard,
  // Passing all the customizable views as parameters
  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).colorScheme.primary;
    return AppCard(
      title: title,
      content: Text(
        content,
        style: Theme.of(context).textTheme.bodyText1,
      ),
      // Imagen de la tarjeta
      topLeftWidget: SizedBox(
        height: 48.0,
        width: 48.0,
        child: Center(
          child: CircleAvatar(
            minRadius: 14.0,
            maxRadius: 14.0,
            backgroundImage: NetworkImage(picUrl),
          ),
        ),
      ),
      // topRightWidget widget as an IconButton
      topRightWidget: IconButton(
        icon: Icon(
          Icons.add_reaction_outlined,
          color: primaryColor,
        ),

        //Acciones al activar el botón de agregar amigos 
        onPressed: (){
          controladorAmigos.addContador();
          controladorEliminarAmigos.deleteContador();
          int contador = controladorAmigos.contadorF.value;
          Get.showSnackbar(
            GetBar(
              message: 'Has agregado $contador amigos',
              duration: const Duration(seconds: 2),
            ),
          );
        }
      ),
    );
  }
}
