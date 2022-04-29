import 'package:get/get.dart';

class DeletePersonController extends GetxController{
  final contadorE = 10.obs;

  void deleteContador(){
    contadorE.value--;
  }

  void resetContadorDelete(){
    contadorE.value = 10;
  }
}