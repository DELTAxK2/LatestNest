import 'package:flutter/material.dart';

class AppCard extends StatelessWidget {
  final Widget? topLeftWidget, topRightWidget, content, extraContent;
  final String title;

  // AppCard constructor
  const AppCard(
      {Key? key,
      required this.title,
      this.content,
      this.topLeftWidget,
      this.topRightWidget,
      this.extraContent})
      : super(
          key: key,
        );

  // Building basic card style
  // With the option to modify its content
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,                     //Sombra de elevación de las tarjetas
      child: Container(
        padding: const EdgeInsets.only(
            top: 4.0, bottom: 16.0, left: 8.0, right: 8.0),     //Espacio de bordes internos de las tarjetas
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,   //Alineación de texto a la derecha
          children: [
            Row(          //Imagen, título e ícono
              children: [
                topLeftWidget != null     //Imagen de la tarjeta
                    ? topLeftWidget!
                    : const SizedBox(
                        width: 48.0,
                      ),
                Expanded(                 //Título de la tarjeta
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ),
                topRightWidget != null    //Ícono de la tarjeta
                    ? topRightWidget!
                    : const SizedBox(
                        width: 48.0,
                      ),
              ],
            ),
            const SizedBox(               //Altura general de la tarjeta
              height: 6.0,
            ),
            if (content != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: content,
              ),
            if (extraContent != null)
              Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: extraContent,
              ),
          ],
        ),
      ),
    );
  }
}
