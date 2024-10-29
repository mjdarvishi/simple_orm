# Simple_orm
Simple orm wich shows how rom lik floor works.
This orm mechanism has 3 part:
1. processor
2. value object
3. writer

## How it works
At first we neeed to specify the anonotations which are responsible to gather the information for processing part. like floor i declear anotation for Entity, Dao and etc.You can check all annotations in annotations.dart file.
Then we get the meta dta of necessery inforation like table name, columns data and etc with mirrors. 
In processing part we convert these information to value object classes which are responsible for keeping data of diffrent part of our orm for example we convert extracting data from annotations for TableInfo class which holds the data of the table or Column info and etc.
The last part of our Orm is writers that gets the the values objects and use them to create queries and command for writing in data base.

## Run
For running you can run main.dart file.
Base on this Test data
```
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
```
You can see the query statement for create table and also generated qeuries for UserDao class.
