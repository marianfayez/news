import 'package:flutter/material.dart';
import 'package:news/models/news_model.dart';

import '../api_manager.dart';
import '../models/sources_model.dart';
import 'news_item.dart';

class SourcesSection extends StatefulWidget {
  String categoryId;
   SourcesSection({required this.categoryId,super.key});

  @override
  State<SourcesSection> createState() => _SourcesSectionState();
}

class _SourcesSectionState extends State<SourcesSection> {
int selectedIndex=0;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourcesModel>(
        future: ApiManager.getSources(widget.categoryId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else {
            List<Sources> data = snapshot.data?.sources ?? [];
            return Column(
              children: [
                DefaultTabController(
                  initialIndex: selectedIndex,
                    length: data.length,
                    child: TabBar(
                      onTap: (value){
                        selectedIndex=value;
                        setState(() {
                        });
                      },
                        isScrollable: true,
                        dividerColor: Colors.transparent,
                        indicatorColor: Theme.of(context).primaryColor,
                        labelColor: Theme.of(context).primaryColor,
                        tabs: data
                            .map((element) => Tab(text: element.name))
                            .toList())),
                Expanded(
                    child: FutureBuilder<NewsModel>(
                        future: ApiManager.getNewsData(data[selectedIndex].id??""),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else if (snapshot.hasError) {
                            return Center(
                                child: Text("Error: ${snapshot.error}"));
                          } else {
                            var data = snapshot.data?.articles ?? [];
                            if(data.isEmpty){
                              return const Center(child: Text("No Data Found"));
                            }
                            return ListView.builder(
                              itemBuilder: (context, index) {
                                return NewsItem(
                                  articles: data[index],
                                );
                              },
                              itemCount: data.length,
                            );
                          }
                        }))
              ],
            );
          }
        });
  }
}
