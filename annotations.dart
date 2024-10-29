class Entity {
  final String? tableName;

  const Entity({this.tableName});
}

class PrimaryKey {
  const PrimaryKey();
}

class Column {
  final String? name;

  const Column({this.name});
}

class Dao {
  const Dao();
}

class Query {
  final String sql;

  const Query(this.sql);
}

class Insert {
  const Insert();
}

class Update {
  const Update();
}

class Delete {
  const Delete();
}