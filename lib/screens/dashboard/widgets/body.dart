import 'package:flutter/material.dart';
import 'package:test_berita/model/category_model.dart';
import 'package:test_berita/screens/dashboard/widgets/item_category.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
          ),
          itemCount: listCategory.length,
          itemBuilder: (_, index) => ItemCategory(
            model: listCategory[index],
          ),
        ),
      ),
    );
  }
}
