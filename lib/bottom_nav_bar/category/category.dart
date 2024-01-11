import 'package:category_product/data/model/category_model/category_model.dart';
import 'package:category_product/widget/custom_text_field.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  TextEditingController categoryController = TextEditingController();
  List<Category> obektCategory = [];
  Category category = Category();

  @override
  void initState() {
    // _obektCategoryTable();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Category',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: ListView(
        children: [
          ...List.generate(obektCategory.length, (index) {
            Category cat = obektCategory[index];
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.grey,
              ),
              child: Center(
                child: ListTile(
                  trailing: Text(
                    'id: ${cat.id}',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  title: Text(
                    'nomi: ${cat.nomi}',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
              ),
            );
          })
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(actions: [
                Column(
                  children: [
                    const SizedBox(height: 15),
                    CustomTextField(
                      action: TextInputAction.done,
                      type: TextInputType.text,
                      controller: categoryController,
                      hintText: 'category',
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                        onPressed: () async {
                          Category categor = Category();
                          categor.id = category.id;
                          categor.nomi = categoryController.text;
                          await categor.insert();
                          setState(() {});
                          // await _selectAllCategory();
                          Navigator.of(context).pop();
                        },
                        child: const Text('Mahsulotni Qo\'shish'))
                  ],
                )
              ]);
            },
          );
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }

  // _obektCategoryTable() async {
  //   Category.object = (await Category.service.select()).map(
  //     (key, value) => MapEntry(
  //       key,
  //       Category.fromJson(value),
  //     ),
  //   );
  //   _selectAllCategory();
  // }
  //
  // _selectAllCategory() async {
  //   obektCategory = Category.object.values.toList();
  //   setState(() {
  //     obektCategory;
  //   });
  // }
}
