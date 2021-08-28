# NEWSAPI Test Flutter AlfaDigital.id

News app using API https://newsapi.org

## Overview
![newsapi_dashboard](https://user-images.githubusercontent.com/48075162/131204112-9279f64f-cf97-464e-9ed4-bb8a329cf782.png)
![newsapi_sources](https://user-images.githubusercontent.com/48075162/131203826-ac8cf55d-32dd-4182-b354-3153257a7901.png)
![newsapi_news](https://user-images.githubusercontent.com/48075162/131203767-2f199fa5-3bfe-4859-ab4e-cfdd92c0f8d9.png)
![newsapi_detail](https://user-images.githubusercontent.com/48075162/131204169-fc8f5b02-7f82-423c-810b-711153d95a8a.png)

## Feature
1. Main screen - Create a screen to display category list of news.
2. Source screen - Show news sources when user click one of the news categories.
3. Article screen - Show news article when user clicks one of the news sources.
4. Webview news screen - Show the article detail on WebView when user clicks one ofthe articles.
5. Source screen & Article screen - Provide a function to search news sources and articlescreen.
6. Source screen & Article screen - Implement endless scrolling on news sources and articles screen.
7.  Cover positive and negative cases.

## Tools & 3d party libraries
-  Flutter 2.2.3
-  cupertino_icons: ^1.0.2
-  flutter_widget_from_html: ^0.6.2
-  google_fonts: ^2.1.0
-  flutter_svg: ^0.22.0
-  dio: ^4.0.0
-  bloc: ^7.1.0
-  flutter_bloc: ^7.2.0
-  device_info: ^2.0.2
-  shimmer: ^2.0.0
-  intl: ^0.17.0
-  url_launcher: ^6.0.9

## Disclaimer
Please use your own api key. Because I'm worried that my api key will get limited.
Find file lib/utils/values/my_values.dart and change token with your api key.

## How To Run
1. type git clone https://github.com/andriawanridwan/newsapi-test-alfadigital.git on your terminal.
2. open project with vscode or other IDE.
3. run the program with press f5 or type flutter run on terminal.
