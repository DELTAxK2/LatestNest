import 'titulos.dart';
import 'package:test/test.dart';

void main() {
  group("Test cambio de títulos", (){
    late Titulos titulos;
    setUp((){
      titulos = Titulos();
    });

    test("Inicio de la prueba", (){
      expect(titulos.value, 'Inicio');
    });

    test("Cambio a Social", (){
      titulos.cambioSocial();
      expect(titulos.value, 'Social');
    });

    test("Cambio a Ofertas", (){
      titulos.cambioOfertasEventos();
      expect(titulos.value, 'Ofertas y Eventos');
    });

    test("Cambio a Ubicación", (){
      titulos.cambioUbicacion();
      expect(titulos.value, 'Ubicación');
    });

    test("Cambio a Mensajes", (){
      titulos.cambioMensajes();
      expect(titulos.value, 'Mensajes');
    });

    test("Retorno a Inicio", (){
      titulos.retornoInicio();
      expect(titulos.value, 'Inicio');
    });
  });
}