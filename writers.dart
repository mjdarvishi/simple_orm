import 'value_objects.dart';

class CodeWriter {
  String generateEntityCode(TableInfo tableInfo) {
    var columns = tableInfo.columns.map((col) {
      var columnType = col.isPrimaryKey ? 'PRIMARY KEY' : '';
      return '${col.name} TEXT $columnType';
    }).join(', ');

    return '''
    CREATE TABLE ${tableInfo.name} (
      $columns
    );
    ''';
  }

  String generateDaoCode(DaoInfo daoInfo) {
    var methods = daoInfo.methods.map((method) {
      return '''
      ${method.returnType} ${method.methodName}() {
        return _database.rawQuery('${method.query}');
      }
      ''';
    }).join('\n');

    return '''
    class ${daoInfo.name} {
      final Database _database;

      ${daoInfo.name}(this._database);

      $methods
    }
    ''';
  }
}