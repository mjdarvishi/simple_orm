class TableInfo {
  final String name;
  final List<ColumnInfo> columns;

  TableInfo({required this.name, required this.columns});
}

class ColumnInfo {
  final String name;
  final bool isPrimaryKey;

  ColumnInfo({required this.name, this.isPrimaryKey = false});
}

class DaoMethod {
  final String methodName;
  final String query;
  final String returnType;

  DaoMethod({required this.methodName, required this.query, required this.returnType});
}

class DaoInfo {
  final String name;
  final List<DaoMethod> methods;

  DaoInfo({required this.name, required this.methods});
}