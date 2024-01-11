

import 'package:category_product/data/db/crud_service.dart';
import 'package:category_product/data/model/category_model/category_service.dart';

class Category{
  static CrudService service = CategoryService();
  static Map<int, Category> object = {};


  String  nomi='';
  int id=0;

  Category();

  Category.fromJson(Map<String,dynamic> json){
    id = int.parse(json['id'].toString());
    nomi = json['nomi'].toString();
  }

  Map<String,dynamic> toJson(){
    return {
      'id':id,
      'nomi': nomi,
    };
  }

  @override
  String toString() {
    return '''
    id: $id
    nomi: $nomi
    ''';
  }

  Future<void> delete()async{
    Category.object.remove(id);
    await service.delete(where: "id = '$id' ");
  }

  Future<int> insert ()async{
    Category.object[id] = this;
    id = await service.insert(toJson());
    return id;
  }

  Future<void> update () async{
    Category.object[id] = this;
    await service.update(toJson(),where: "id = '$id' ");
  }

}