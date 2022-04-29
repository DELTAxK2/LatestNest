import 'contador.dart';
import 'package:test/test.dart';

void main() {
  group("Test personas agregadas",(){
    late Contador contador;
    setUp((){
      contador = Contador();
    });

    test("Inicio de la prueba", (){
      expect(contador.value, 0);
    });

    test("Agregar", (){
      contador.sumar();
      expect(contador.value, 1);
    });

    test("Eliminar", (){
      contador.restar();
      expect(contador.value, -1);
    });

    test("Reiniciar-contador", (){
      contador.sumar();
      expect(contador.value, 1);
      contador.reset();
      expect(contador.value, 0);
    });
  });
}