import 'package:category_product/data/db/crud_service.dart';
import 'package:category_product/data/model/product_model/model_service.dart';

class Product {
  static CrudService service = ProductService();
  static Map<int, Product> object = {};

  int id = 0;
  int count = 0;
  double narxi = 0.0;
  String nomi = '';
  String category = '';
  int categoryId = 0;

  Product();

  Product.fromJson(Map<String, dynamic> json) {
    id = int.parse(json['id'].toString());
    count = int.parse(json['count'].toString());
    narxi = double.tryParse(json['narxi'].toString())!;
    category = json['category'].toString();
    nomi = json['nomi'].toString();
    categoryId = int.parse(json['categoryId'].toString());
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'count': count,
      'narxi': narxi,
      'nomi': nomi,
      'category': category,
      'categoryId': categoryId,
    };
  }

  @override
  String toString() {
    return '''
    id: $id
    count: $count
    narxi: $narxi
    nomi: $nomi
    category: $category
    categoryId: $categoryId
    ''';
  }

  Future<int> insert() async {
    Product.object[id] = this;
    id = await service.insert(toJson());
    return id;
  }

  Future<void> delete() async {
    Product.object.remove(id);
    await service.delete(where: "id='$id'");
  }

  Future<void> update() async {
    Product.object[id] = this;
    await service.update(toJson(), where: "id='$id'");
  }
}
