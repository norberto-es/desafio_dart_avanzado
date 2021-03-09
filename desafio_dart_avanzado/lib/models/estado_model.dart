import 'dart:convert';

class EstadoModel {
  int id;
  String nome;
  String sigla;
  int pais;
  int regiao; 

  
  EstadoModel({
    this.id,
    this.nome,
    this.sigla,
    this.pais,
    this.regiao,
  });


  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'sigla': sigla,
      'pais': pais,      
      'regiao': regiao,
    };
  }

  factory EstadoModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return EstadoModel(
      id: map['id'],
      nome: map['nome'],
      sigla: map['sigla'],
    // pais:  map['regiao'],
    //  regiao: map['regiao'],
    );
  }

  String toJson() => json.encode(toMap());

  factory EstadoModel.fromJson(String source) => EstadoModel.fromMap(json.decode(source));
 }
