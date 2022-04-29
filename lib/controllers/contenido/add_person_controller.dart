import 'package:get/get.dart';

class AddPersonController extends GetxController{
  final contadorF = 0.obs;

  void addContador(){
    contadorF.value++;
  }

  void resetContador(){
    contadorF.value = 0;
  }
}