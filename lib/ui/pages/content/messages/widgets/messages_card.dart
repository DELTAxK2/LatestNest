import 'package:flutter/material.dart';
import '../../../../../ui/widgets/card.dart';

class StateCard extends StatelessWidget {
  final String title, content, picUrl;
  final VoidCallback onChat;

  // StateCard constructor
  const StateCard(
      {Key? key,
      required this.title,
      required this.content,
      required this.picUrl,
      required this.onChat})
      : super(key: key);

  //Contenedor de la tarjeta
  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).colorScheme.primary;
    return AppCard(

      //Título central de la tarjeta
      title: title,

      //Contenido de la tarjeta
      content: Text(
        content,
        style: Theme.of(context).textTheme.bodyText1,
      ),

      // Imagen de la derecha
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

      // Icono de la derecha
      topRightWidget: IconButton(
        icon: Icon(
          Icons.delete,
          color: primaryColor,
        ),
        onPressed: onChat,
      ),

    );
  }
}
