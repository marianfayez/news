import 'package:news/cache_helper.dart';
import 'package:news/models/news_model.dart';
import 'package:news/models/sources_model.dart';
import 'package:news/repository/home_repo.dart';

class RepoLocalImpl implements HomeRepo{
  @override
  Future<NewsModel> getNews(String sourceId) async{
   NewsModel newsModel=await HiveService.getNews(sourceId);
   return newsModel;
  }

  @override
  Future<SourcesModel> getSources(String categoryId) async{
    SourcesModel sourcesModel = await HiveService.getSources(categoryId);
    return sourcesModel;
  }
  
  
}