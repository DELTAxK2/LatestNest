import 'package:LatestNest/controllers/contenido/add_person_controller.dart';
import 'package:get/get.dart';

final testController = Get.put(AddPersonController());

class Contador{
  int contadorF;
  Contador(): contadorF = testController.contadorF.value;

  int get value{
    return contadorF;
  }

  void sumar(){
    contadorF++;
  }

  void restar(){
    contadorF--;
  }

  void reset(){
    contadorF = 0;
  }
}