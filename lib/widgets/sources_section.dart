import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/bloc/cubit.dart';
import 'package:news/bloc/states.dart';
import 'package:news/models/news_model.dart';
import '../models/sources_model.dart';
import 'news_item.dart';

class SourcesSection extends StatelessWidget {
  String categoryId;
  Function onTap;
  SourcesSection({required this.categoryId,required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getSources(categoryId),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context,state){
          if(state is GetNewsErrorState){
            showDialog(context: context,
                builder: (context)=>AlertDialog(
                  title: Text("Error"),
                  content: Text(state.error),
                  actions: [ElevatedButton(onPressed: (){
                    Navigator.pop(context);
                  }, child: Text("Home"))],
                ));
          }
          else if(state is GetSourcesErrorState){
            showDialog(context: context,
                builder: (context)=>AlertDialog(
                  title: Text("Error"),
                  content: Text(state.error),
                  actions: [ElevatedButton(onPressed: (){
                    onTap();
                  }, child: Text("ok"))],
                ));
          }
        },
        builder: (context, state) {
          if (state is GetSourcesLoadingState || state is GetNewsLoadingState) {
            return Center(child: CircularProgressIndicator());
          }
          else {
            var bloc = BlocProvider.of<HomeCubit>(context);
            var list = bloc.sourcesModel?.sources??[];
            return Column(
              children: [
                DefaultTabController(
                    initialIndex: bloc.selectedIndex,
                    length: list.length,
                    child: TabBar(
                        onTap: (value) {
                          bloc.changeIndex(value);
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
                                  articles: bloc.newsModel!.articles![index],
                                );
                              },
                              itemCount: bloc.newsModel?.articles?.length??0,
                            )
                        )]);

          }
        },
      ),
    );
  }


}
