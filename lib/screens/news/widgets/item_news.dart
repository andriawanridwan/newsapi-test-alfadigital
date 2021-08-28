import 'package:flutter/material.dart';
import 'package:test_berita/model/news_model.dart';
import 'package:test_berita/screens/news/detail/detail_news_screen.dart';
import 'package:test_berita/screens/news/widgets/news_publisher.dart';
import 'package:test_berita/utils/values/my_values.dart';
import 'package:test_berita/utils/widgets/custom_card.dart';
import 'package:test_berita/utils/widgets/custom_error.dart';

class ItemNews extends StatelessWidget {
  final NewsModel model;
  const ItemNews({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => DetailNewsScreen(model: model),
          ),
        );
      },
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              child: model.urlToImage == null
                  ? CustomError.noPicture(context)
                  : Image.network(
                      model.urlToImage!,
                      errorBuilder: (BuildContext context, Object exception,
                          StackTrace? stackTrace) {
                        return CustomError.noPicture(context);
                      },
                    ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NewsPublisher(
                  date: model.publishedAt,
                  publisher: model.author ?? '-',
                ),
                SizedBox(height: 2),
                Text(
                  model.title,
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(height: 5),
                (model.description == null || model.description == '')
                    ? Text(
                        MyValues.no_description,
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            color: Colors.grey, fontStyle: FontStyle.italic),
                      )
                    : Text(
                        model.description!,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
