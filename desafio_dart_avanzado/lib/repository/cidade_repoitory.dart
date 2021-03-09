import 'package:desafio_dart_avanzado/conecion.dart';
import 'package:desafio_dart_avanzado/models/ciudad_model.dart';
import 'package:dio/dio.dart';

class CiudadRepository {
  Future<List<CiudadModel>> leoCiudades(idestado) async {
    var url =
        'https://servicodados.ibge.gov.br/api/v1/localidades/estados/$idestado/municipios';
    var dio = Dio();
    print('idestado ${idestado}');
    var response = await dio.get<List>(url,
        options: Options(responseType: ResponseType.json));

    if (response.statusCode == 200) {
      return response.data.map((e) => CiudadModel.fromMap(e)).toList();
    }
  }

  Future<void> graboCiudad({id, nome, estado}) async {
    var conn = await getConnection();
    var existe = await conn.query('select id from ciudades where id = ?', [id]);
    if (existe.isEmpty) {
      var result = await conn.query(
          'insert into ciudades(id, nome,estado) values (?,?,?)',
          [id, nome, estado]);
      print('Ciudad:   ${id}  ${nome}   ${estado}');
    } else {
      print('Ciudad existe:   ${id}  ${nome}   ${estado}');
    }

    await conn.close();
  }
}
