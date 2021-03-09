import 'package:desafio_dart_avanzado/conecion.dart';
import 'package:desafio_dart_avanzado/models/estado_model.dart';
import 'package:dio/dio.dart';

class EstadoRepository {
  Future<List<EstadoModel>> leoEstados(idregion) async {
    var url =
        'https://servicodados.ibge.gov.br/api/v1/localidades/regioes/$idregion/estados';
    var dio = Dio();
    print(' idregion: ${idregion}');
    var response = await dio.get<List>(url,
        options: Options(responseType: ResponseType.json));

    if (response.statusCode == 200) {
      return response.data.map((e) => EstadoModel.fromMap(e)).toList();
    }
  }

  Future<void> graboEstado({id, nome, sigla,pais ,regiao}) async {
    var conn = await getConnection();
    var existe = await conn.query('select id from estados where id = ?', [id]);
    if (existe.isEmpty) {
      var result = await conn.query(
          'insert into estados(id, nome, sigla,pais,region) values (?,?,?,?,?)',
          [id, nome, sigla,pais ,regiao]);
      print('Estado:   ${id}  ${nome}   ${sigla}  ${pais}  ${regiao}');
    } else {
      print('Estado existe:   ${id}  ${nome}');
    }

    await conn.close();
  }
}
