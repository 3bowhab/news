class NewsSourceModel {
  final String title;

  NewsSourceModel({required this.title});

  static List<NewsSourceModel> source = [
    NewsSourceModel(title: 'BBC News'),
    NewsSourceModel(title: 'CNN'),
    NewsSourceModel(title: 'Al Jazeera English'),
    NewsSourceModel(title: 'The New York Times'),
    NewsSourceModel(title: 'The Guardian'),
    NewsSourceModel(title: 'Reuters'),
    NewsSourceModel(title: 'Associated Press'),
    NewsSourceModel(title: 'Fox News'),
    NewsSourceModel(title: 'NBC News'),
  ];
}
