import 'dart:async';

import 'package:desafio_dart_avanzado/conecion.dart';
import 'package:desafio_dart_avanzado/models/region_model.dart';
import 'package:dio/dio.dart';

class RegionRepository {
  Future<List<RegionModel>> leoRegion() async {
    var url = 'https://servicodados.ibge.gov.br/api/v1/localidades/regioes';
    var dio = Dio();

    var response = await dio.get<List>(url,
        options: Options(responseType: ResponseType.json));

    if (response.statusCode == 200) {
      return response.data.map((e) => RegionModel.fromMap(e)).toList();
    }
  }

  Future<void> graboRegion({id, nome, sigla,pais}) async {
    var conn = await getConnection();
    var existe = await conn.query('select id from regiones where id = ?', [id]);
    if (existe.isEmpty) {
      var result = await conn.query(
          'insert into regiones(id, nome, sigla,pais) values (?,?,?,?)',
          [id, nome, sigla,pais]);
      print('Region:   ${id}  ${nome}   ${sigla}');
    } else {
      print('Region   existe:   ${id}  ${nome}   ${sigla}');
    }
    await conn.close();
  }
}
