import 'package:LatestNest/controllers/contenido/delete_person_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'widgets/person_publications_card.dart';

final controladorEliminarAmigos = Get.put(DeletePersonController());
int contadorDel = controladorEliminarAmigos.contadorE.value;

class UsersOffersScreen extends StatefulWidget {
  // UsersOffersScreen empty constructor
  const UsersOffersScreen({Key? key}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<UsersOffersScreen> {
  final items = List<String>.generate(contadorDel, (i) => "Item $i");

  @override
  Widget build(BuildContext context) {
    
    return GetX<DeletePersonController>(
      builder: (controller){
        return Expanded(
          child: ListView.builder(
            itemCount: controller.contadorE.value,
            itemBuilder: (context, index) {
              return PostCard(
                title: 'Ludvig Wiese',
                content:
                    'Duis non tellus sed quam luctus gravida quis sed libero. Pellentesque luctus lorem eu est varius, eu dignissim leo tincidunt. Fusce eget ante sed mi venenatis tincidunt et rutrum neque. Suspendisse laoreet sapien sed est aliquet fringilla. Fusce fringilla, ante in ultrices volutpat, mauris ',
                picUrl:
                    'https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50?s=200',
                onChat: () => {},
              );
            }
          ),
        );
      }
    );

    // return ListView.builder(
    //   itemCount: items.length,
    //   itemBuilder: (context, index) {
        // return PostCard(
        //   title: 'Ludvig Wiese',
        //   content:
        //       'Duis non tellus sed quam luctus gravida quis sed libero. Pellentesque luctus lorem eu est varius, eu dignissim leo tincidunt. Fusce eget ante sed mi venenatis tincidunt et rutrum neque. Suspendisse laoreet sapien sed est aliquet fringilla. Fusce fringilla, ante in ultrices volutpat, mauris ',
        //   picUrl:
        //       'https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50?s=200',
        //   onChat: () => {},
        // );
    //   },
    // );
  }
}
