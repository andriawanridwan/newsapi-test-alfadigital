import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_berita/model/category_model.dart';
import 'package:test_berita/screens/sources/sources_screen.dart';
import 'package:test_berita/utils/widgets/custom_card.dart';

class ItemCategory extends StatelessWidget {
  final CategoryModel model;
  const ItemCategory({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => SourcesScreen(model: model),
          ),
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            model.svgPath,
            width: MediaQuery.of(context).size.width * 0.25,
          ),
          SizedBox(height: 10),
          Text(
            model.name,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ],
      ),
    );
  }
}
