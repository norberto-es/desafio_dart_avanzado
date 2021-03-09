
import 'package:desafio_dart_avanzado/conecion.dart';

class PaisRepository{
  
 Future<void> graboPais() async {
    var conn = await getConnection();
    var existe = await conn.query('select nome from paises where nome = ?', ['Brasil']);
    if (existe.isEmpty) {
      var result = await conn.query(
          'insert into paises(id, nome) values (?,?)',
          [1, 'Brasil']);
      } else {
      print('Pais existe}');
    }
    await conn.close();
  }


}