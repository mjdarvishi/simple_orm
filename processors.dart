import 'annotations.dart';
import 'value_objects.dart';
import 'dart:mirrors';

class EntityProcessor {
  TableInfo process(ClassMirror classMirror) {
    final tableName = classMirror.metadata
        .whereType<Entity>()
        .first
        .tableName ?? classMirror.simpleName;

    final columns = classMirror.declarations.values
        .whereType<VariableMirror>()
        .map((field) => ColumnInfo(
              name: (field.metadata.whereType<Column>().first.name ?? field.simpleName)as String,
              isPrimaryKey: field.metadata.whereType<PrimaryKey>().isNotEmpty,
            ))
        .toList();

    return TableInfo(name: tableName as String, columns: columns);
  }
}

class DaoProcessor {
  DaoInfo process(ClassMirror classMirror) {
    var methods = classMirror.declarations.values
        .whereType<MethodMirror>()
        .map((method) {
          var query = method.metadata.whereType<Query>().first.sql;
          return DaoMethod(
            methodName: method.simpleName  as String,
            query: query,
            returnType: method.returnType.simpleName  as String,
          );
        })
        .toList();

    return DaoInfo(name: classMirror.simpleName  as String, methods: methods);
  }
}