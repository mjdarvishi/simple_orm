import 'annotations.dart';
import 'processors.dart';
import 'writers.dart';
import 'dart:mirrors';


@Entity(tableName: 'users')
class User {
  @PrimaryKey()
  final int id;

  @Column(name: 'user_name')
  final String name;

  User(this.id, this.name);
}

@Dao()
abstract class UserDao {
  @Query('SELECT * FROM users')
  List<User> getAllUsers();

  @Insert()
  void insertUser(User user);

  @Update()
  void updateUser(User user);

  @Delete()
  void deleteUser(User user);
}

void main() {
  // Simulate reflection (in Dart you would use mirrors or code generation)
  var entityProcessor = EntityProcessor();
  var tableInfo = entityProcessor.process(reflectType(User) as ClassMirror);

  var daoProcessor = DaoProcessor();
  var daoInfo = daoProcessor.process(reflectType(UserDao)as ClassMirror) ;

  var writer = CodeWriter();
  var createTableSQL = writer.generateEntityCode(tableInfo);
  var daoCode = writer.generateDaoCode(daoInfo);

  print(createTableSQL);
  print(daoCode);
}
