

import 'package:category_product/data/model/category_model/category_service.dart';
import 'package:category_product/data/model/product_model/model_service.dart';
import 'package:sqlite_wrapper/sqlite_wrapper.dart';
import 'package:path/path.dart';

SQLiteWrapper db = SQLiteWrapper();


class DatabaseHelper{
  DatabaseHelper._init();

  static final DatabaseHelper _singleton = DatabaseHelper._init();
  static  int version = 1;

  factory DatabaseHelper(){
    return _singleton;
  }

  Future<DatabaseInfo> initDb(dbPath,{inMemory=false})async{
    dbPath = join(dbPath,'base.sqlite');

    return db.openDB(dbPath,
        version: version,onCreate: _onCreate
    );
  }

  Future<void> _onCreate() async{
    List<String> sql = [];
    sql.add(ProductService.createTable);
    sql.add(CategoryService.createTableCategory);
    print('CategoryService.createTableCategory: ${CategoryService.createTableCategory}');
    print('ProductService.createTable: ${ProductService.createTable}');

    for(var query in sql){
      await db.execute(query);
    }
  }

}