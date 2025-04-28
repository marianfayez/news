import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/bloc/cubit.dart';
import 'package:news/bloc/states.dart';
import 'package:news/models/news_model.dart';
import 'package:news/repository/repo_local_impl.dart';
import 'package:news/repository/repo_remote_impl.dart';
import '../models/sources_model.dart';
import 'news_item.dart';

class SourcesSection extends StatelessWidget {
  String categoryId;
  Function onTap;
  SourcesSection({required this.categoryId,required this.onTap, super.key});

  bool hasInternet = false;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(repo: hasInternet? RepoRemoteImpl():RepoLocalImpl())..getSources(categoryId),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context,state){
          if(state is GetNewsErrorState){
            showDialog(context: context,
                builder: (context)=>AlertDialog(
                  title: const Text("Error"),
                  content: Text(state.error,style: const TextStyle(color: Colors.black),),
                  actions: [ElevatedButton(onPressed: (){
                    Navigator.pop(context);
                  }, child: const Text("Home"))],
                ));
          }
          else if(state is GetSourcesErrorState){
            showDialog(context: context,
                builder: (context)=>AlertDialog(
                  title: const Text("Error"),
                  content:  Text(state.error,style: const TextStyle(color: Colors.black),),
                  actions: [ElevatedButton(onPressed: (){
                    onTap();
                  }, child: const Text("ok"))],
                ));
          }
        },
        builder: (context, state) {
          if (state is GetSourcesLoadingState || state is GetNewsLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          else {
            var list = HomeCubit.get(context).sourcesModel?.sources??[];
            return Column(
              children: [
                DefaultTabController(
                    initialIndex: HomeCubit.get(context).selectedIndex,
                    length: list.length,
                    child: TabBar(
                        onTap: (value) {
                          HomeCubit.get(context).changeIndex(value);
                        },
                        isScrollable: true,
                        dividerColor: Colors.transparent,
                        indicatorColor: Theme
                            .of(context)
                            .primaryColor,
                        labelColor: Theme
                            .of(context)
                            .primaryColor,
                        tabs: list
                            .map((element) => Tab(text: element.name))
                            .toList())),
                Expanded(
                    child: ListView.builder(
                              itemBuilder: (context, index) {
                                return NewsItem(
                                  articles: HomeCubit.get(context).newsModel!.articles![index],
                                );
                              },
                              itemCount: HomeCubit.get(context).newsModel?.articles?.length??0,
                            )
                        )]);

          }
        },
      ),
    );
  }


}
