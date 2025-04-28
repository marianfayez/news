import 'package:news/models/news_model.dart';
import 'package:news/models/sources_model.dart';

abstract class HomeRepo{

  Future<SourcesModel> getSources(String categoryId);
  Future<NewsModel> getNews(String sourceId);

}