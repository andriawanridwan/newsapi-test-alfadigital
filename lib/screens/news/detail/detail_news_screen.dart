import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:test_berita/model/news_model.dart';
import 'package:test_berita/screens/news/widgets/news_publisher.dart';
import 'package:test_berita/utils/helpers/url_launcher.dart';
import 'package:test_berita/utils/values/my_colors.dart';
import 'package:test_berita/utils/values/my_values.dart';
import 'package:test_berita/utils/widgets/custom_appbar.dart';
import 'package:test_berita/utils/widgets/custom_error.dart';

class DetailNewsScreen extends StatelessWidget {
  final NewsModel model;
  const DetailNewsScreen({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar.general(
        context: context,
        title: MyValues.detail_news,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                model.title,
                style: Theme.of(context).textTheme.headline6,
              ),
              SizedBox(height: 5),
              NewsPublisher(
                date: model.publishedAt,
                publisher: model.author ?? '-',
              ),
              SizedBox(height: 10),
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
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
              SizedBox(height: 10),
              HtmlWidget(
                model.content ?? '',
                onTapUrl: (url) async => UrlLauncher.launchUrl(url),
                textStyle: Theme.of(context).textTheme.bodyText1!,
              ),
              SizedBox(height: 10),
              Text(
                '${MyValues.more_details}: ',
                style: Theme.of(context).textTheme.bodyText1!,
              ),
              GestureDetector(
                onTap: () async => UrlLauncher.launchUrl(model.url),
                child: Text(
                  model.url,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontStyle: FontStyle.italic,
                        color: MyColors.primary,
                        decoration: TextDecoration.underline,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
