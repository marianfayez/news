import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:news/bloc/states.dart';
import 'package:http/http.dart' as http;
import '../models/news_model.dart';
import '../models/sources_model.dart';

class HomeCubit extends Cubit<HomeStates>{
  SourcesModel? sourcesModel;
  NewsModel? newsModel;
  int selectedIndex = 0;

  HomeCubit():super (HomeInitState());

  void getSources(String categoryId)async{
    try{
      emit(GetSourcesLoadingState());
      Uri url = Uri.https("newsapi.org", "/v2/top-headlines/sources",
          {"apiKey": "3512e29a752f4dd6bc7339fa9094bc3c","category":categoryId});
      http.Response response = await http.get(url);
      var json = jsonDecode(response.body);
      sourcesModel= SourcesModel.fromJson(json);
      if(sourcesModel?.status =="ok"){
        getNewsData();
        emit(GetSourcesSuccessState());
      }else{
        emit(GetSourcesErrorState(error: sourcesModel?.message??""));
      }
    }catch(e){
      emit(GetSourcesErrorState(error: "Something went wrong"));
    }
  }

  void getNewsData ()async{
    try{
      emit(GetNewsLoadingState());
      Uri url=Uri.https("newsapi.org","/v2/everything",
          {"apiKey": "3512e29a752f4dd6bc7339fa9094bc3c","sources":sourcesModel?.sources?[selectedIndex].id??""});
      http.Response response = await http.get(url);
      var json = jsonDecode(response.body);
      newsModel= NewsModel.fromJson(json);

      if(newsModel?.status=="ok"){
        emit(GetNewsSuccessState());
      }else{
        emit(GetNewsErrorState(error:newsModel?.message??""));
      }
    }catch(e){
      emit(GetNewsErrorState(error: "Something went wrong"));
    }
  }

  void changeIndex(int index){
    selectedIndex = index;
    getNewsData();
    emit(ChangeSourcesIndex());
  }
}