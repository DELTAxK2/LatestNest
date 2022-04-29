import 'package:LatestNest/ui/widgets/card.dart';
import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  final String title, content, picUrl;
  final VoidCallback onChat;

  // Elementos de la tarjeta
  const PostCard(
      {Key? key,
      required this.title,
      required this.content,
      required this.picUrl,
      required this.onChat})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).colorScheme.primary;
    return AppCard(
      title: title,

      //Contenido de la tarjeta
      content: Text(
        content,
        style: Theme.of(context).textTheme.bodyText1,
      ),

      // topLeftWidget widget as an Avatar
      topLeftWidget: SizedBox(
        height: 48.0,
        width: 48.0,

        //Imagen de la tarjeta
        child: Center(
          child: CircleAvatar(
            minRadius: 14.0,
            maxRadius: 14.0,
            backgroundImage: NetworkImage(picUrl),
          ),
        ),

      ),
      
      //Ícono a la derecha de la tarjeta
      topRightWidget: IconButton(
        icon: Icon(
          Icons.more_horiz,
          color: primaryColor,
        ),
        onPressed: onChat,
      ),
    );
  }
}
