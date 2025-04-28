import 'package:hive/hive.dart';
import 'package:news/models/news_model.dart';
import 'package:news/models/sources_model.dart';

class HiveService {

  static const String sourceBox ="SourceBox";
  static const String newsBox ="NewsBox";

 static Future<Box<SourcesModel>> _openSourcesBox(String category) async{
   if(!Hive.isBoxOpen(sourceBox+category)){
     return await Hive.openBox<SourcesModel>(sourceBox+category);
   }
   return Hive.box<SourcesModel>(sourceBox+category);
 }

  static Future<void> saveSources(SourcesModel source,String category) async{
   var box = await _openSourcesBox(category);

   await box.put("sourceModel", source);
 }

  static Future<SourcesModel> getSources(String category) async{
   var box = await _openSourcesBox(category);
  SourcesModel? sourcesModel= box.get("sourceModel");
  return sourcesModel ?? SourcesModel();
 }

  static Future<void> deleteSource(String category) async{
   var box = await _openSourcesBox(category);
   box.delete("sourceModel");
 }

 static Future<Box<NewsModel>> _openNewsBox(String sourceId) async{

   if(!Hive.isBoxOpen(newsBox+sourceId)){
     return await Hive.openBox<NewsModel>(newsBox+sourceId);
   }
   return Hive.box<NewsModel>(newsBox+sourceId);
 }

 static Future<void> saveNews(NewsModel news,String sourceId) async{
   var box = await _openNewsBox(sourceId);
   await box.put("newsModel", news);
 }

 static Future<NewsModel> getNews(String sourceId) async{
   var box= await _openNewsBox(sourceId);
   NewsModel? newsModel= box.get("newsModel");
   return newsModel ?? NewsModel();
 }

 static Future<void> deleteNews(String sourceId) async{
   var box= await _openNewsBox(sourceId);
   box.delete("newsModel");
 }
}