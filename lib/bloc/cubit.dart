import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/bloc/states.dart';
import 'package:http/http.dart' as http;
import 'package:news/repository/home_repo.dart';
import '../models/news_model.dart';
import '../models/sources_model.dart';

class HomeCubit extends Cubit<HomeStates>{
  SourcesModel? sourcesModel;
  NewsModel? newsModel;
  int selectedIndex = 0;
  HomeRepo repo;

  HomeCubit({required this.repo}):super (HomeInitState());

  static HomeCubit get(context)=> BlocProvider.of(context);
  void getSources(String categoryId)async{
    try{
      emit(GetSourcesLoadingState());
      sourcesModel=await repo.getSources(categoryId);
      if(sourcesModel?.status =="ok"){
        getNewsData();
        emit(GetSourcesSuccessState());
      }else{
        emit(GetSourcesErrorState(error: sourcesModel?.message??"Something went wrong"));
      }
    }catch(e){
      emit(GetSourcesErrorState(error: "Something went wrong"));
    }
  }

  void getNewsData ()async{
    try{
      emit(GetNewsLoadingState());
      newsModel=await repo.getNews(sourcesModel?.sources?[selectedIndex].id??"");

      if(newsModel?.status=="ok"){
        emit(GetNewsSuccessState());
      }else{
        emit(GetNewsErrorState(error:newsModel?.message??"Something went wrong"));
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