import 'dart:convert';

class RegionModel {
  int id; 
  String sigla;
  String nome;
  int pais;
  
  RegionModel({
    this.id,
    this.sigla,
    this.nome,
    this.pais,
  });


  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'sigla': sigla,
      'nome': nome,
      'pais': pais,
    };
  }

  factory RegionModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return RegionModel(
      id: map['id'],
      sigla: map['sigla'],
      nome: map['nome'],
    );
  }

  String toJson() => json.encode(toMap());

  factory RegionModel.fromJson(String source) => RegionModel.fromMap(json.decode(source));
}
