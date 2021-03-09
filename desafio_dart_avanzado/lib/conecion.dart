import 'package:mysql1/mysql1.dart';

Future<MySqlConnection> getConnection() async {
var settings = ConnectionSettings(
  host: 'localhost', 
  port: 3306,
  user: 'root',
 // password: '',
  db: 'catastro'
);
return  await MySqlConnection.connect(settings);
}