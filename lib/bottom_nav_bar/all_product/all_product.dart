import 'package:category_product/bottom_nav_bar/sub_sceen.dart';
import 'package:category_product/data/model/category_model/category_model.dart';
import 'package:category_product/data/model/product_model/model.dart';
import 'package:flutter/material.dart';

class AllProduct extends StatefulWidget {
  const AllProduct({super.key});

  @override
  State<AllProduct> createState() => _AllProductState();
}

class _AllProductState extends State<AllProduct> {
  List<Product> obektProduct = [];
  List<Category> obektCategory = [];
  Product product = Product();
  Category category = Category();




  @override
  void initState() {
    // _obektCategoryTable();
    // _obektProductTable();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>const AddItem(),
                ),
              );
            },
            icon:const Icon(
              Icons.add,
              color: Colors.teal,
            ),
          ),
        ],
        centerTitle: true,
        title: Text(
          'All Product',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: Column(
        children: [
          TextField(),
          const SizedBox(height: 15),
          Expanded(
            child: GridView.builder(
                itemCount: obektProduct.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 10,
                    childAspectRatio: 5 / 6),
                itemBuilder: (context, index) {
                  Product product = obektProduct[index];
                  Category category = obektCategory[index];
                  return Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.teal),
                    child: Column(
                      children: [
                        Text('nomi: ${product.nomi}'),
                        const SizedBox(height: 5),
                        Text('category: ${category.nomi}'),
                        Row(
                          children: [
                            Text('count: ${product.count}'),
                            Spacer(),
                            Text('narxi: ${product.narxi}')
                          ],
                        ),
                      ],
                    ),
                  );
                },),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){},child:const Icon(Icons.add),),
    );
  }



  // _obektProductTable() async {
  //   Product.object = (await Product.service.select()).map(
  //         (key, value) => MapEntry(
  //       key,
  //       Product.fromJson(value),
  //     ),
  //   );
  //   _selectAll();
  // }
  // _selectAll() async {
  //   obektProduct = Product.object.values.toList();
  //   setState(() {
  //     obektProduct;
  //   });
  // }
  //
  // // category
  // _obektCategoryTable() async {
  //   Category.object = (await Category.service.select()).map(
  //         (key, value) => MapEntry(
  //       key,
  //       Category.fromJson(value),
  //     ),
  //   );
  //   _selectAllCategory();
  // }
  // _selectAllCategory() async {
  //   obektCategory = Category.object.values.toList();
  //   setState(() {
  //     obektProduct;
  //   });
  // }
}

