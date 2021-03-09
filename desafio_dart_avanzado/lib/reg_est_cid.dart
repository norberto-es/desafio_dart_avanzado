import 'package:desafio_dart_avanzado/repository/cidade_repoitory.dart';
import 'package:desafio_dart_avanzado/repository/estado_repository.dart';
import 'package:desafio_dart_avanzado/repository/pais_repository.dart';
import 'package:desafio_dart_avanzado/repository/region_repository.dart';

void run() async {
  var grabopais = await PaisRepository().graboPais();
  var paisid = 1;  
  var regiones = await RegionRepository().leoRegion();
  print('-' * 20 + 'ini  de la carga fin' + '-' * 20);
  for (var i = 0; i < regiones.length; i++) {
    await RegionRepository().graboRegion(
        id: regiones[i].id, 
        nome: regiones[i].nome, 
        sigla: regiones[i].sigla,
        pais: paisid );

    var regionid = regiones[i].id;

    var estados = await EstadoRepository().leoEstados(regionid);
 

    for (var f = 0; f < estados.length; f++) {
      await EstadoRepository().graboEstado(
        id: estados[f].id,
        nome: estados[f].nome,
        sigla: estados[f].sigla,
        pais : paisid,
        regiao: regionid);
        
        var estadoid=estados[f].id;
        var ciudades = await CiudadRepository().leoCiudades(estadoid); 
     
         for (var f = 0; f < ciudades.length; f++) {
             await CiudadRepository().graboCiudad(
                id: ciudades[f].id,
                nome: ciudades[f].nome,
                estado: estadoid);
                }     
     
    }
  }

  print('-' * 20 + 'fin de la carga fin' + '-' * 20);
}
