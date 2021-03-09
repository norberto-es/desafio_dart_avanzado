import 'dart:convert';

class CiudadModel {
int id;
String  nome;
int estado;
  CiudadModel({
    this.id,
    this.nome,
    this.estado,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'estado': estado,
    };
  }

  factory CiudadModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return CiudadModel(
      id: map['id'],
      nome: map['nome'],
   //   estado: map['estado'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CiudadModel.fromJson(String source) => CiudadModel.fromMap(json.decode(source));
}
