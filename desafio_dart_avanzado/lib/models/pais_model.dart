import 'dart:convert';


class RegionModel {
  int id; 
  String nome;
  
  RegionModel({
    this.id,
    this.nome,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
    };
  }

  factory RegionModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return RegionModel(
      id: map['id'],
      nome: map['nome'],
    );
  }

  String toJson() => json.encode(toMap());

  factory RegionModel.fromJson(String source) => RegionModel.fromMap(json.decode(source));
}
