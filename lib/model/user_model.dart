class UserModel {
  String? uidL;
  String? correoL;
  String? n_amigosL;
  String? nombreL;
  String? passwordL;
  String? usuarioL;

  UserModel({this.uidL, this.correoL, this.n_amigosL, this.nombreL, this.passwordL, this.usuarioL});

  //Datos desde el servidor
  factory UserModel.fromMap(map){
    return UserModel(
      uidL: map['uid'],
      correoL: map['correo'],
      n_amigosL: map['n_amigos'],
      nombreL: map['nombre'],
      passwordL: map['password'],
      usuarioL: map['usuario'],
    );
  }

  //Enviar datos al servidor
  Map <String, dynamic> toMap(){
    return{
      'uid': uidL,
      'correo': correoL,
      'n_amigos': n_amigosL,
      'nombre': nombreL,
      'password': passwordL,
      'usuario': usuarioL,
    };
  }
}