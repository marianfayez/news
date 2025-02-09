import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news/api_manager.dart';
import 'package:news/models/sources_model.dart';
import 'package:news/widgets/category_section.dart';
import 'package:news/widgets/sources_section.dart';

import '../widgets/app_drawer.dart';


class HomeScreen extends StatefulWidget {
  static String routeName = "HomeScreen";

   HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(selectedCategory??"Home",style: Theme.of(context).textTheme.titleMedium,),
      ),
      drawer:AppDrawer(onTab: onDrawerTab,),
      body: selectedCategory == null ? CategorySection(onTab:onSelectedCategory,):
      SourcesSection(categoryId: selectedCategory!,),
    );
  }

  String? selectedCategory;

  onSelectedCategory(category){
    selectedCategory = category;
    setState(() {

    });
  }
  onDrawerTab(){
    Navigator.pop(context);
    selectedCategory = null;
    setState(() {

    });
  }
}
