import 'package:LatestNest/controllers/contenido/title_name_controller.dart';
import 'package:get/get.dart';

final testController = Get.put(ControladorTitulo());

class Titulos{
  late String tituloB;
  Titulos(): tituloB = testController.tituloGeneral.value;

  String get value{
    return tituloB;
  }

  void cambioSocial(){
    tituloB = 'Social';
  }

  void cambioOfertasEventos(){
    tituloB = 'Ofertas y Eventos';
  }

  void cambioUbicacion(){
    tituloB = 'Ubicación';
  }

  void cambioMensajes(){
    tituloB = 'Mensajes';
  }

  void retornoInicio(){
    tituloB = 'Social';
    tituloB = 'Inicio';
  }
}