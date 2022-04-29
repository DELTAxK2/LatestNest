import 'package:LatestNest/controllers/contenido/add_person_controller.dart';
import 'package:LatestNest/controllers/contenido/delete_person_controller.dart';
import 'package:LatestNest/ui/pages/content/content_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final controllerReset = Get.put(AddPersonController());
final controllerDelete = Get.put(DeletePersonController());

class CustomAppBar extends AppBar {
  final BuildContext context;
  final String picUrl;
  final Widget tile;
  final VoidCallback onSignOff;
  
  // Creating a custom AppBar that extends from Appbar with super();
  CustomAppBar(
      {Key? key,
      required this.context,
      required this.picUrl,
      required this.tile,
      required this.onSignOff})
      : super(

          key: key,                   //Imagen circular en la barra
          centerTitle: true,
          leading: Center(
            child: CircleAvatar(
              minRadius: 18.0,
              maxRadius: 18.0,
              backgroundImage: NetworkImage(picUrl),
            ),
          ),

          title: tile,              //Título central de la barra (texto) Ubicación /lib/ui/pages/content/content_page.dart

          actions: [

            IconButton(             //Ícono de modo nocturno
              icon: const Icon(
                Icons.brightness_4_rounded,
              ),
              onPressed: () {
                Get.changeThemeMode(
                    Get.isDarkMode ? ThemeMode.light : ThemeMode.dark);
              },
            ),
            
            IconButton(              //Ícono de logout
              icon: const Icon(
                Icons.logout,
              ),
              onPressed: (){
                onSignOff;
                controllerReset.resetContador();
                controllerDelete.resetContadorDelete();
                Get.offNamed('/auth');
              }
            )
          ],
        );
}
