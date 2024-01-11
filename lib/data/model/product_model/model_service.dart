import 'package:category_product/data/db/crud_service.dart';
import 'package:category_product/data/db/initial_db.dart';
import 'package:flutter/material.dart';



class ProductService extends CrudService {
  @override
  ProductService({super.prefix = ''}) : super('productTable');

  static String createTable = '''
CREATE TABLE IF NOT EXISTS productTable (
id INTEGER NOT NULL DEFAULT 0,
count INTEGER NOT NULL DEFAULT,
narxi REAL NOT NULL DEFAULT 0.0,
nomi TEXT NOT NULL DEFAULT ' ',
category TEXT NOT NULL DEFAULT ' ',
categoryId INTEGER NOT NULL DEFAULT 0,
PRIMARY KEY (id AUTOINCREMENT)
);
''';

  @override
  Future<void> delete({String? where}) async {
    where = where == null ? "" : "WHERE $where";
    await db.query("DELETE FROM $table $where");
    debugPrint("bazada shu IDdagi mahsulot o'chirildi");
  }

  @override
  Future<int> insert(Map map) async {
    map['id'] = (map['id'] == 0) ? null : map['id'];
    var insertDb = await db.insert(map as Map<String, dynamic>, table);
    debugPrint('ProductService "insert" methodi ishladi');
    return insertDb;
  }

  @override
  Future<Map> select({String? where}) async {
    where = where == null ? "" : "WHERE $where";
    Map<int, dynamic> map = {};
    await for (final rows
        in db.watch("SELECT * FROM $table $where", tables: [table])) {
      for (final element in rows) {
        map[element['id']] = element;
      }
      return map;
    }
    debugPrint("ProductService 'select' methodi ishladi ");
    return map;
  }

  @override
  Future<Map> selectId(int id, {String? where}) async {
    Map row = await db.query("SELECT * FROM $table WHERE id = ?",
        params: [id], singleResult: true);
    debugPrint('ProductService "selectID" methodi ishladi');
    return row;
  }

  @override
  Future<void> update(Map map, {String? where}) async {
    where = where == null ? "" : " WHERE $where";

    String updateClause = "";
    final List params = [];
    final values = map.keys; //.where((element) => !keys.contains(element));
    for (String value in values) {
      if (updateClause.isNotEmpty) updateClause += ", ";
      updateClause += "$value=?";
      params.add(map[value]);
    }

    final String sql = "UPDATE $table SET $updateClause$where";
    await db.execute(sql, tables: [table], params: params);
  }
}
